source _examples/shell/supernova.sh

## Chains: Compounding Styles (Shell)

echo WARNING: Intense color found. | $supernova italic.yellow
echo Beautiful pink. | $supernova underline.color '#e317e0'

echo Reflection, refraction and dispersion. | \
  $supernova gradient \
  '#FF0000' '#FFFF00' '#00FF00' '#0FF0FE' '#233CFE'
