local Helpers = require 'supernova.maintenance.helpers'
local inspect = require 'inspect'
local ColorHelper = require 'supernova.helpers.color'

-- From https://github.com/meodai/color-names

local ColorNamesBuilder = {}

function ColorNamesBuilder.build(csv_path, destination_path, destination_path_by_key)
  local input_file = assert(io.open(csv_path, 'rb'))
  local content = input_file:read('*all')
  input_file:close()

  local names = {}
  local names_by_key = {}

  local is_header = true

  for line in content:gmatch('([^\n]*)\n?') do
    if not is_header then

      local comma_position = line:find(',')

      local name = line:sub(1, comma_position - 1)
      local rgb = line:sub(comma_position + 1, #line)

      local identifier, key = Helpers.to_identifier(name)

      names_by_key[key] = {
        identifier = identifier,
        name = name,
        rgb = ColorHelper.hex_to_rgb(rgb)
      }

      table.insert(names, names_by_key[key])
    else
      is_header = false
    end
  end

  names = Helpers.sort_by(names, 'identifier')

  local output_file = assert(io.open(destination_path, 'w'))
  output_file:write('local COLOR_NAMES = ' .. inspect(names) .. '\n\nreturn COLOR_NAMES')
  output_file:close()

  output_file = assert(io.open(destination_path_by_key, 'w'))
  output_file:write(
    'local COLOR_NAMES_BY_KEY = ' .. inspect(names_by_key) ..
    '\n\nreturn COLOR_NAMES_BY_KEY'
  )
  output_file:close()
end

local csv_file_path = arg[1]

ColorNamesBuilder.build(
  csv_file_path,
  'supernova/helpers/color_names.lua', 'supernova/helpers/color_names_by_key.lua'
)
