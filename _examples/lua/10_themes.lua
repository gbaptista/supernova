local supernova = require 'supernova'

-- ## Themes (Lua)

-- ### Custom Themes (Lua)

local love_theme = {
  identifier = 'love',
  author = 'Robert Indiana',
  colors = { '#2659D8', '#1C6FF3', '#5EBC4E', '#53A946', '#F24534' },
  styles = {
    intense = supernova.style.italic.underline.bright_yellow(),
    bluetiful = supernova.style.color('#3C69E7')
  }
}

local theme = supernova:register(love_theme)

print('Theme: ' .. theme.identifier)

for _, style in pairs(theme.styles) do
  print(' - ' .. style)
end


print(supernova.love.muted_green('muted_green'))
print(supernova.love.bluetiful('bluetiful'))
print(supernova.love.intense('intense'))

print(supernova.love.rainbow('Lorem ipsum dolor sit amet.'))
