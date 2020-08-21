local supernova = require 'supernova'

-- ## Themes (Lua)

-- ### Custom Themes (Lua)

local theme = supernova:get_theme('default')

print('Theme: ' .. theme.identifier)

for _, style in pairs(theme.styles) do
  print(' - ' .. style)
end
