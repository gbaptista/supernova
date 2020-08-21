local Helpers = {}

local StringHelper = require 'supernova.helpers.string'

Helpers['to_identifier'] = StringHelper.to_identifier

function Helpers.stable_keys(table_with_keys)
  local keys = {}
  local i = 0

  for key in pairs(table_with_keys) do
    i = i+1
    keys[i] = key
  end

  table.sort(keys)

  return keys
end

function Helpers.sort_by(table_to_sort, property)
  local values = {}

  for _, value in pairs(table_to_sort) do
    local property_value = value[property]

    if values[property_value] == nil then
      values[property_value] = {}
    end

    table.insert(values[property_value], value)
  end

  local sorted_table = {}

  for _, value in pairs(Helpers.stable_keys(values)) do
    for _, item in pairs(values[value]) do
      table.insert(sorted_table, item)
    end
  end

  return sorted_table
end

return Helpers
