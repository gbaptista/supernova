local Color = {}

local ANSI = require 'supernova.core.ansi'
local Sgr = require 'supernova.core.sgr'

local ColorReductor = require 'supernova.core.color_reductor'
local ColorHelper = require 'supernova.helpers.color'

function Color.apply_string(content, sgr_code, input, colors)
  return Color.apply_rgb(content, sgr_code, ColorHelper.string_to_rgb(input), colors)
end

function Color.apply_rgb(content, sgr_code, rgb, colors)
  if colors == nil then
    error('missing colors')
  end

  if colors ~= 'true-color' and colors < 8 then
    return content
  end

  if colors ~= 'true-color' then
    return Color.apply_code(content, sgr_code, ColorReductor.rgb_to_code(rgb), colors)
  end

  local command = (
    tostring(sgr_code) .. ';2;' ..
    rgb[1] .. ';' .. rgb[2] .. ';' .. rgb[3] ..
    'm'
  )

  return ANSI.wrap(command .. content)
end

function Color.apply_sgr_code(content, sgr_code, sgr_modifier, colors)
  if colors == nil then
    error('missing colors')
  end

  if colors ~= 'true-color' and colors < 8 then
    return content
  end

  return Sgr.apply(content, sgr_code, sgr_modifier)
end

function Color.apply_code(content, sgr_code, color_code, colors)
  if colors == nil then
    error('missing colors')
  end

  if colors ~= 'true-color' and colors < 8 then
    return content
  end

  if colors ~= 'true-color' and colors < 16 then
    return Color.apply_sgr_code(
      content, ColorReductor.code_to_sgr_8(sgr_code, color_code), nil, colors
    )
  elseif colors ~= 'true-color' and colors < 256 then
    return Color.apply_sgr_code(
      content, ColorReductor.code_to_sgr_16(sgr_code, color_code), nil, colors
    )
  end

  local command = tostring(sgr_code) .. ';5;' ..color_code .. 'm'

  return ANSI.wrap(command .. content)
end

function Color.apply_gradient(content, sgr_code, colors_hex, colors)
  if colors == nil then
    error('missing colors')
  end

  local largest_line = nil

  for line in content:gmatch('([^\n]*)\n?') do
    if largest_line == nil or #line > largest_line then
      largest_line = #line
    end
  end

  local parts = #colors_hex - 1

  local content_part_length = math.ceil(largest_line/parts)
  local content_part_max = math.ceil(largest_line/parts)

  if content_part_length == 0 then
    content_part_length = 1
  end

  local result = ''

  local first_line = true

  for line in content:gmatch('([^\n]*)\n?') do
    if not first_line then
      result = result .. '\n'
    else
      first_line = false
    end

    for i = 1, parts do
      local from = ((i - 1) * content_part_length) + 1
      local to = from + content_part_length - 1

      if i == parts then
        to = largest_line
      end

      result = result .. Color.apply_gradient_between(
        line:sub(from, to), sgr_code,
        colors_hex[i], colors_hex[i+1],
        content_part_max, colors
      )
    end
  end

  return result
end

function Color.apply_gradient_between(content, sgr_code, from_hex, to_hex, max_length, colors)
  if colors == nil then
    error('missing colors')
  end

  local from_rgb = from_hex
  local to_rgb = to_hex

  if type(from_hex[1]) ~= 'number' then
    from_rgb = ColorHelper.string_to_rgb(from_hex)
    to_rgb = ColorHelper.string_to_rgb(to_hex)
  end

  local colors_rgb = ColorHelper.naive_gradient(from_rgb, to_rgb, max_length)

  local result = ''

  for i = 1, #content do
    result = result .. Color.apply_rgb(content:sub(i, i), sgr_code, colors_rgb[i], colors)
  end

  return result
end

return Color
