local ColorHelper = require 'supernova.helpers.color'

local HELPERS = {
  hex_to_rgb = ColorHelper.hex_to_rgb,
  rgb_to_hex = ColorHelper.rgb_to_hex,
  rgbs_to_hex = ColorHelper.rgbs_to_hex,
  to_rgb = ColorHelper.string_to_rgb,
  nearest_colors = ColorHelper.nearest_colors,
  nearest_color = ColorHelper.nearest_color,
  nearest = ColorHelper.nearest,

  inspect = ColorHelper.nearest,

  -- Aliases
  names = ColorHelper.names,
  name = ColorHelper.name,
}

return HELPERS
