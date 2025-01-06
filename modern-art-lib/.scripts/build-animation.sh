#!/bin/bash
# Prompt user for starting folders. Works with ./ or full paths
echo "Please input the working path excluding the closing /"
read workingpath
echo "Please input the video file name"
read videofile
echo "How much should the video be scaled down? 1 is unchanged, .5 is half scale"
read videoscale

# Initialize work environment
if [ -f $workingpath/config_data.txt ]
then
	rm $workingpath/config_data.txt
fi
configreport=$workingpath/config_data.txt

mkdir $workingpath/extractedframes
mkdir $workingpath/montages
imagefolder="$workingpath/extractedframes"
outputfolder="$workingpath/montages"

### FFmpeg --------------------------------------------------------------------------------------

# Adds framerate into config report. No idea how regex works, stole from stack exchange
fps=$(ffmpeg -i $workingpath/$videofile 2>&1 | sed -n "s/.*, \(.*\) fp.*/\1/p")

# Extract video frames
function runffmpeg() {
  ffmpeg -i "$workingpath/$videofile" -vf scale=iw*$videoscale:-1 -r $fps $workingpath/extractedframes/frame%06d.png -hide_banner -loglevel error
}
echo "Extracting video frames..."
runffmpeg

# get current number of files in working folder. Check to see if it's greater than Factorio's frame limit
num_pngs=$(ls $imagefolder/*.png | wc -l)

if [ $num_pngs -gt 255 ]; then
    # Reduce framerate until it'll generate fewer than 255 frames. Round down to nearest whole number
    # Bash not having floating point sucks so we use bc
    fps=$(bc <<< "scale=2; $fps/($num_pngs/255)")
    # bc sucks because it can't round down the final number. chop off everything after the decimal
    fps=$(echo ${fps%.*})
    echo "Too many frames for Factorio. New framerate "$fps
    rm -r $imagefolder
    mkdir $imagefolder
    runffmpeg
fi

### Imagemagick --------------------------------------------------------------------------------------

image_size=4096

# Calculate the number of columns and rows that will fit into a 2000x2000px image
png_width=$(identify -format "%w" "$imagefolder/frame000001.png")
png_height=$(identify -format "%h" "$imagefolder/frame000001.png")

columns=$((image_size / png_width))
rows=$((image_size / png_height))

framewidth=$((image_size/columns))
frameheight=$((image_size/rows))

widthmargin=$(((framewidth-png_width)/2))
heightmargin=$(((frameheight-png_height)/2))

# get number of frames
num_pngs2=$(ls $imagefolder/*.png | wc -l)

# fix edge case where if you have less than one page of frames the image is cut short and it gives the wrong new_frame_height
framesperimage=$((columns*rows))
if [ $num_pngs2 -lt $framesperimage ] ; then
  echo "step 1"
  #num_imgs_needed=$((framesperimage-num_pngs2))
  for (( i=num_pngs2 + 1 ; i<=$framesperimage ; i++)); do
    namevar=$(printf "%06d\n" $i)
    echo "step 2 : " $namevar
    convert -size ${png_width}x${png_height} xc:transparent $workingpath/extractedframes/frame$namevar.png
  done
fi

# Combine images into grids based on rows and columns
echo "Combining frames into images..."
montage -background none -tile ${columns}x${rows} -geometry +${widthmargin}+${heightmargin} ${imagefolder}/*.png "${outputfolder}/montage%06d.png"

# Some images don't come out to a clean 4096x4096. easier to recaclulate stuff than add artificial border
# This method fixes an edge case where final image is 5px off causing wobble in frame
new_frame_width=$(identify -format "%w" "$outputfolder/montage000000.png")
new_frame_height=$(identify -format "%h" "$outputfolder/montage000000.png")
recalc_frame_width=$((new_frame_width/columns))
recalc_frame_height=$((new_frame_height/rows))

echo "Finalizing images..."
# move images to root folder
filecount=0
for image in $outputfolder/*.png; do
    filecount=$((filecount+1))
    mv "$image" "${workingpath}/${filecount}.png"
done


#Print config data in the right order in the file
echo "Size =" $recalc_frame_width", "$recalc_frame_height >> $configreport
echo "Framerate =" $fps >> $configreport
echo "Frame Count =" $num_pngs2 >> $configreport
echo "Files =" $filecount >> $configreport
echo "Width in Frames =" $columns >> $configreport
echo "Height in Frames =" $rows >> $configreport

# Cleanup working files
rm -r $workingpath/extractedframes
rm -r $workingpath/montages
