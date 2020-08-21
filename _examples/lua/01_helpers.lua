local supernova = require 'supernova'

-- ### Helpers (Lua)

print(supernova.name('#34a2eb'))
print(supernova.name({ 52, 162, 235 }))

do local hex = '#34a2eb'
  for _, name in pairs(supernova.names(hex)) do
    print('Name for ' .. hex .. ': ' .. name)
  end
end

do local rgb = { 224, 53, 40 }
   local hex = supernova.rgb_to_hex(rgb)

  for _, name in pairs(supernova.names(rgb)) do
    print('Name for ' .. hex .. ': ' .. name)
  end
end

do local rgb = supernova.hex_to_rgb('#34a2eb')
  print(
    '#34a2eb > ' ..
    'Red: ' .. rgb[1] .. ' Green:' .. rgb[2] .. ' Blue:' .. rgb[3]
  )
end

do local rgb = supernova.to_rgb('Fox')
  print(
    'Fox > ' ..
    'Red: ' .. rgb[1] .. ' Green:' .. rgb[2] .. ' Blue:' .. rgb[3]
  )
end
