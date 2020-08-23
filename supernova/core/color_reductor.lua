local ColorReductor = {}

local ColorHelper = require 'supernova.helpers.color'
local TableHelper = require 'supernova.helpers.table'
local ANSI = require 'supernova.core.ansi'

ColorReductor['COLOR_PALETTES'] = {
  [256] = require 'supernova.core.reductor.256_vga',
  [16]  = require 'supernova.core.reductor.16_vga',
  [8]   = {}
}

ColorReductor['COLOR_PALETTES'][8] = TableHelper.pack(TableHelper.unpack(
  ColorReductor['COLOR_PALETTES'][16], 1, 8
))

function ColorReductor.rgb_to_code(rgb)
  local result = ColorHelper.nearest(rgb, ColorReductor['COLOR_PALETTES'][256])
  return result.colors[1].code
end

function ColorReductor.code_to_sgr(sgr_code, color_code, colors)
  local result = ColorHelper.nearest(
    ColorReductor['COLOR_PALETTES'][256][color_code].rgb,
    colors
  )
  local color_index = result.colors[1].code

  if color_index > 8 then
    color_index = color_index - 8
  end

  color_index = color_index - 1

  local color

  if sgr_code == ANSI.SGR_CODES.color then
    if result.colors[1].code > 8 then
      color = 90 + color_index
    else
      color = 30 + color_index
    end
  elseif sgr_code == ANSI.SGR_CODES.background then
    if result.colors[1].code > 8 then
      color = 100 + color_index
    else
      color = 40 + color_index
    end
  end

  return color
end

function ColorReductor.code_to_sgr_16(sgr_code, color_code)
  return ColorReductor.code_to_sgr(sgr_code, color_code, ColorReductor['COLOR_PALETTES'][16])
end

function ColorReductor.code_to_sgr_8(sgr_code, color_code)
  return ColorReductor.code_to_sgr(sgr_code, color_code, ColorReductor['COLOR_PALETTES'][8])
end

return ColorReductor
