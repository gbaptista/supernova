local supernova = require 'supernova'

-- ## Themes (Lua)

-- ### Custom Styles (Lua)

supernova:register(
  'intense'
).italic.bold.underline.bright_magenta()

supernova:register('warning').italic.color('#ffa200')

supernova:register('super_warning').warning.bold.underline()

print(supernova.intense('intense'))
print(supernova.warning('warning'))
print(supernova.super_warning('super_warning'))
