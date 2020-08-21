local supernova = require 'supernova'

print(supernova.italic.yellow('WARNING: Intense color found.'))
print(supernova.underline.color('Beautiful pink.', '#e317e0'))

print(supernova.gradient(
  'Reflection, refraction and dispersion.',
  { '#FF0000', '#FFFF00', '#00FF00', '#0FF0FE', '#233CFE' }
))
