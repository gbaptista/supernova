local supernova = require 'supernova'

-- ## Colon Smart Operator (Lua)

supernova:disable()

-- It will print colors and styles:
print(supernova.italic.red('Hello World'))
print(supernova.color('Hello World', '#D52222'))

-- It will NOT print colors or styles:
print(supernova.italic:red('Hello World'))
print(supernova:color('Hello World', '#D52222'))

supernova:enable()

-- It will print colors and styles:
print(supernova.italic.red('Hello World'))
print(supernova.color('Hello World', '#D52222'))

-- It will print colors and styles:
print(supernova.italic:red('Hello World'))
print(supernova:color('Hello World', '#D52222'))

-- ### Color Support (Lua)

supernova:set_colors('true_color')

print(supernova:color('Hello World', '#D52222'))

supernova:set_colors(256)

print(supernova:color('Hello World', '#D52222'))

supernova:set_colors(8)

print(supernova:color('Hello World', '#D52222'))
