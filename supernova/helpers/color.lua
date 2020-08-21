local COLOR_NAMES = require 'supernova.helpers.color_names'
local COLOR_NAMES_BY_KEY = require 'supernova.helpers.color_names_by_key'

local StringHelper = require 'supernova.helpers.string'

local Color = {}

function Color.string_to_rgb(input)
  local _, key = StringHelper.to_identifier(input)

  if COLOR_NAMES_BY_KEY[key] ~= nil then
    return COLOR_NAMES_BY_KEY[key].rgb
  end

  return Color.hex_to_rgb(input)
end

function Color.hex_to_rgb(hex)
  hex = hex:gsub('#', '')

  return {
    tonumber('0x' .. hex:sub(1, 2)),
    tonumber('0x' .. hex:sub(3, 4)),
    tonumber('0x' .. hex:sub(5, 6))
  }
end

function Color.rgb_to_hex(rgb)
  local hex = ''

  for _, value in pairs(rgb) do
    local partial_hex = ''

    while(value > 0)do
      local index = math.fmod(value, 16) + 1
      value = math.floor(value / 16)
      partial_hex = string.sub('0123456789ABCDEF', index, index) .. partial_hex
    end

    if(string.len(partial_hex) == 0)then
      partial_hex = '00'

    elseif(string.len(partial_hex) == 1)then
      partial_hex = '0' .. partial_hex
    end

    hex = hex .. partial_hex
  end

  return '#' .. hex
end

function Color.rgbs_to_hex(rgbs)
  local hexs = {}

  for _, rgb in pairs(rgbs) do
    table.insert(hexs, Color.rgb_to_hex(rgb))
  end

  return hexs
end

function Color.nearest_colors(rgb_color)
  local result = Color.nearest(rgb_color)

  local colors = {}

  for _, color in pairs(result.colors) do
    table.insert(colors, {
      identifier = color.identifier,
      name = color.name,
      rgb = color.rgb,
      hex = Color.rgb_to_hex(color.rgb)
    })
  end

  return { colors = colors, distance = result.distance }
end

function Color.names(rgb_color)
  local result = Color.nearest_colors(rgb_color)

  local names = {}

  for _, color in pairs(result.colors) do
    table.insert(names, color.name)
  end

  return names
end

function Color.name(rgb_color)
  local result = Color.nearest_color(rgb_color)

  return result.color.name
end

function Color.nearest_color(rgb_color)
  local result = Color.nearest(rgb_color)

  -- TODO: Find a better way to tie the colors.
  local nearest_color = result.colors[1]

  return {
    color = {
      identifier = nearest_color.identifier,
      name = nearest_color.name,
      rgb = nearest_color.rgb,
      hex = Color.rgb_to_hex(nearest_color.rgb)

    },
    distance = result.distance
  }
end

function Color.nearest(rgb_color, colors_list)

  if colors_list == nil then
    colors_list = COLOR_NAMES
  end

  if type(rgb_color) == 'string' then
    rgb_color = Color.string_to_rgb(rgb_color)
  end

  local nearest_distance = nil
  local nearest_colors = {}

  for _, cadidate_color in pairs(colors_list) do
    if type(cadidate_color) ~= 'number' then
      local distance = (
        ((rgb_color[1] - cadidate_color.rgb[1]) ^ 2) +
        ((rgb_color[2] - cadidate_color.rgb[2]) ^ 2) +
        ((rgb_color[3] - cadidate_color.rgb[3]) ^ 2)
      )

      if nearest_distance == nil or distance < nearest_distance then
        nearest_colors = { cadidate_color }
        nearest_distance = distance
      elseif distance == nearest_distance then
        table.insert(nearest_colors, cadidate_color)
      end
    end
  end

  return {
    original = rgb_color,
    colors = nearest_colors,
    distance = nearest_distance
  }
end

function Color.naive_gradient(from_rgb, to_rgb, length)
  local colors = {}

  local step = 1 / (length - 1)

  if length > 0 then
    table.insert(colors, from_rgb)
  end

  for mix = step, 1.0, step do
    if mix >= 1.0 then
      break
    end

    local color = {
      math.floor((from_rgb[1] * (1 - mix)) + (to_rgb[1] * mix)),
      math.floor((from_rgb[2] * (1 - mix)) + (to_rgb[2] * mix)),
      math.floor((from_rgb[3] * (1 - mix)) + (to_rgb[3] * mix))
    }
    table.insert(colors, color)
  end

  if length > 1 then
    table.insert(colors, to_rgb)
  end

  return colors
end

return Color
