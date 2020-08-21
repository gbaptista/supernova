local supernova = require 'supernova'

print(supernova.default.red('Hello World'))
print(supernova.custom_theme_name.red('Hello World'))
print(supernova.custom_theme_name.custom_style('Hello World'))

--

supernova:set_theme('my_custom_theme')

print(supernova.my_custom_style('Hello World'))
