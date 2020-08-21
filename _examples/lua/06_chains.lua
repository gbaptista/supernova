local supernova = require 'supernova'

-- ## Chains: Compounding Styles (Lua)

print(supernova.italic.red.underline('Hello World'))
print(supernova.yellow.bold.bg_blue.strike('Hello World'))
print(supernova.bold.bg_red.underline.color('Hello World', '#34a2eb'))
print(supernova.italic.color('Hello World', 'Deep Sky Blue'))

-- ### Nested Calls Warning (Lua)
-- Don't do that:
-- print(supernova.bold.color(
--   supernova.italic.bg('Hello World', '#0fd447'), '#ed3d0c'
-- ))
