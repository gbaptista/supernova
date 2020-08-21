source _examples/shell/supernova.sh

### Shell Background Colors

#### Shell SGR 8 Background Colors (3/4 bit)
echo Hello World | $supernova bg-black
echo Hello World | $supernova bg-blue
echo Hello World | $supernova bg-cyan
echo Hello World | $supernova bg-green
echo Hello World | $supernova bg-magenta
echo Hello World | $supernova bg-red
echo Hello World | $supernova bg-white
echo Hello World | $supernova bg-yellow

#### Shell SGR 8 Bright Background Colors (3/4 bit)
echo Hello World | $supernova bg-bright-black
echo Hello World | $supernova bg-gray # same as bright-black

echo Hello World | $supernova bg-bright-blue
echo Hello World | $supernova bg-bright-cyan
echo Hello World | $supernova bg-bright-green
echo Hello World | $supernova bg-bright-magenta
echo Hello World | $supernova bg-bright-red
echo Hello World | $supernova bg-bright-white
echo Hello World | $supernova bg-bright-yellow

#### Shell SGR 256 Background Colors (8-bit)
echo Hello World | $supernova background 1
echo Hello World | $supernova background 2
echo Hello World | $supernova background 3
echo Hello World | $supernova background 253
echo Hello World | $supernova background 255
echo Hello World | $supernova background 256

#### Shell SGR True Background Color (24-bit)
echo Hello World | $supernova background '#34a2eb' # Hex
echo Hello World | $supernova background 235 52 223 # RGB
echo Hello World | $supernova background Honey # Name

#### Shell SGR Gradient True Background Color (24-bit)
echo Hello World | $supernova bg-gradient '#eb3434' '#343aeb'
echo Hello World | $supernova bg-gradient '#FF0000' '#FF7F00' '#FFFF00' '#00FF00'
echo Hello World | $supernova bg-gradient 'Honey' 'Bolognese'
