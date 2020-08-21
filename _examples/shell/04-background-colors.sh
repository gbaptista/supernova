source _examples/shell/supernova.sh

## Background Colors (Shell)

echo Hello World | $supernova bg-blue
echo Hello World | $supernova bg-bright-red
echo Hello World | $supernova background-blue
echo Hello World | $supernova background-bright-red

echo Hello World | $supernova bg 253
echo Hello World | $supernova background 255
echo Hello World | $supernova background '#343aeb'
echo Hello World | $supernova background 'Honey'

echo Hello World | $supernova bg-gradient '#eb3434' '#343aeb'
echo Hello World | $supernova background-gradient '#343aeb' '#eb3434'
