local function deep_copy_internal(original)
  local copy = {}
  for k, v in pairs(original) do
    -- copy embedded tables
    if type(v) == "table" then
      v = deep_copy_internal(v)
    end
    copy[k] = v
  end
  return copy
end

local function deep_copy(prototype, name)
  return deep_copy_internal(data.raw[prototype][name])
end

return deep_copy
