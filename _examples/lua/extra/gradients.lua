local supernova = require 'supernova'

print('')
print(supernova.gradient(
  '/  In laoreet velit in finibus tempus./',
  { '#ff0000', '#00ff00', '#0000ff' }
))

print('')
print(supernova.gradient([[
  Lorem ipsum dolor sit amet
  Lorem ipsum
  Dolor sit
  amet
  In laoreet velit in finibus tempus.
]], { '#ff0000', '#00ff00', '#0000ff' }))

print('')
print(supernova.gradient([[
  Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet
  Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum
  Dolor sit Dolor sit Dolor sit Dolor sit Dolor sit Dolor sit Dolor sit Dolor sit
  amet amet amet amet amet amet amet amet amet amet amet amet amet amet amet amet
  In laoreet velit in finibus tempus In laoreet velit in finibus tempus.
]], { '#ff0000', '#00ff00', '#0000ff', '#fbff00' }))

print('')
print(supernova.gradient(
  'oi',
  { '#ff0000', '#00ff00', '#0000ff', '#fbff00' }
))

print('')
print(supernova.gradient(
  'o',
  { '#ff0000', '#00ff00', '#0000ff', '#fbff00' }
))

print('')
print(supernova.gradient(
  '',
  { '#ff0000', '#00ff00', '#0000ff', '#fbff00' }
))


print('\n\n')
print('  [' .. supernova.gradient('lorem ipsum', '#00de07', '#fbff00') .. ']')
print('')
