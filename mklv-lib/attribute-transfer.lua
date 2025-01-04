local mklv_consts = require("__mklv-lib__.consts")

local function attribute_transfer(entity, source)
  local ref = mklv_consts.transfer_ref[source]
  local prototype = table.deepcopy(data.raw[ref.type][ref.name])

  entity.name = entity.name .. ref.suffix
  for _, attribute in pairs(ref.attributes) do
    entity[attribute] = prototype[attribute]
  end

  return entity
end

return attribute_transfer
