local View = {}

local ColorHelper = require 'supernova.helpers.color'

local supernova = require 'supernova'

function View.rgb_to_hex(arguments, result)
  print(' ' .. supernova.bg('   ', arguments.params[1]) .. ' ' .. result)
end

function View.to_rgb(_, result)
  print(' ' .. supernova.bg('   ', result) .. ' ' .. result[1] .. ' ' .. result[2] .. ' ' .. result[3])
end

View['hex_to_rgb'] = View.to_rgb

function View.name(_, result)
  print(result)
end

function View.inspect(arguments, result)
  local width = 72
  local input = arguments.params[1]

  if input[2] ~= nil then
    input = (
      arguments.params[1][1] ..
      ' ' .. arguments.params[1][2] ..
      ' ' .. arguments.params[1][3]
    )
  end

  print(View.header(width))

  View.print('', width)

  View.print('Identifying the ' .. supernova.bold(input) .. ' color:', width)
  View.print('', width)

  View.print(View.inspect_rgb(result.original), width)

  View.print('', width)

  if result.colors[2] == nil then
    View.print('Suggested name for the color:', width)
  else
    View.print('Suggested names for the color:', width)
  end

  for _, color in pairs(result.colors) do
    View.print('', width)

    View.print('- ' .. color.name, width)
    View.print(
      '  ' .. View.inspect_rgb(color.rgb),
    width)
  end

  View.print('', width)
  print(View.footer(width))
end

function View.inspect_rgb(rgb)
  local color_hex = ColorHelper.rgb_to_hex(rgb)

  return (
    supernova.bg('   ', rgb) ..
    ' Hex: ' .. supernova.bold(color_hex) ..
    ' Red: ' .. supernova.red.bold(rgb[1]) ..
    ' Green: ' .. supernova.green.bold(rgb[2]) ..
    ' Blue: ' .. supernova.blue.bold(rgb[3])
  )
end

function View.print(content, width)
  print(View.box_it(content, width))
end

function View.header(width)
  return ' ┌' .. View.ensure_size('', width-2, '─') .. '┐'
end

function View.footer(width)
  return ' └' .. View.ensure_size('', width-2, '─') .. '┘'
end

function View.box_it(content, width)
  return ' │  ' .. View.ensure_size(content, width-4) .. '│'
end

function View.ensure_size(content, width, fill)
  if fill == nil then
    fill = ' '
  end

  local clean_content = content:gsub('\27%[.?([^m]*)m?', '')

  if #clean_content >= width then
    return content
  end

  local missing = width - #clean_content

  for _ = 1, missing do
    content = content .. fill
  end

  return content
end

return View
