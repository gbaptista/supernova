local supernova = require 'supernova'

-- ## Background Colors (Lua)

print(supernova.bg_blue('Hello World'))
print(supernova.bg_bright_red('Hello World'))
print(supernova.background_blue('Hello World'))
print(supernova.background_bright_red('Hello World'))

print(supernova.bg('Hello World', 253))
print(supernova.background('Hello World', 255))
print(supernova.background('Hello World', '#34a2eb'))
print(supernova.background('Hello World', 'Honey'))

print(supernova.bg_gradient('Hello World', { '#eb3434', '#343aeb' }))
print(supernova.background_gradient('Hello World', {'#343aeb', '#eb3434' }))
