local supernova = require 'supernova'

-- ## Themes (Lua)

-- ### Custom Styles (Lua)

supernova:register(
  'intense', 'my_custom_theme'
).italic.bold.underline.bright_magenta()

supernova:register(
  'warning', 'my_custom_theme'
).italic.color('#ffa200')

supernova:register(
  'super_warning', 'my_custom_theme'
).warning.bold.underline()

print(supernova.my_custom_theme.intense('intense'))
print(supernova.my_custom_theme.warning('warning'))
print(supernova.my_custom_theme.super_warning('super_warning'))

supernova:set_theme('my_custom_theme')

print(supernova.intense('intense'))
print(supernova.warning('warning'))
print(supernova.super_warning('super_warning'))
