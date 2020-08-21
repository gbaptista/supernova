source _examples/shell/supernova.sh

## Chains: Compounding Styles (Shell)

echo Hello World | $supernova italic.red.underline
echo Hello World | $supernova yellow.bold.bg-blue.strike
echo Hello World | $supernova bold.bg-red.underline.color '#34a2eb'
echo Hello World | $supernova italic.color 'Deep Sky Blue'

echo Hello World | $supernova italic.bg '#0fd447' | $supernova bold.color '#ed3d0c'
