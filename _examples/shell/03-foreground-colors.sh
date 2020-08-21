source _examples/shell/supernova.sh

### Foreground Colors (Shell)

#### SGR 8 Colors (3/4 bit) (Shell)
echo Hello World | $supernova black
echo Hello World | $supernova blue
echo Hello World | $supernova cyan
echo Hello World | $supernova green
echo Hello World | $supernova magenta
echo Hello World | $supernova red
echo Hello World | $supernova white
echo Hello World | $supernova yellow

#### SGR 8 Bright Colors (3/4 bit) (Shell)
echo Hello World | $supernova bright-black
echo Hello World | $supernova gray # same as bright-black

echo Hello World | $supernova bright-blue
echo Hello World | $supernova bright-cyan
echo Hello World | $supernova bright-green
echo Hello World | $supernova bright-magenta
echo Hello World | $supernova bright-red
echo Hello World | $supernova bright-white
echo Hello World | $supernova bright-yellow

#### SGR 256 Colors (8-bit) (Shell)
echo Hello World | $supernova color 1
echo Hello World | $supernova color 2
echo Hello World | $supernova color 3
# ...
echo Hello World | $supernova color 253
echo Hello World | $supernova color 255
echo Hello World | $supernova color 256

#### SGR True Color (24-bit) (Shell)
echo Hello World | $supernova color '#34a2eb' # Hex
echo Hello World | $supernova color 235 52 223 # RGB
echo Hello World | $supernova color 'Honey' # Name

#### SGR Gradient True Color (24-bit) (Shell)
echo Hello World | $supernova gradient '#eb3434' '#343aeb'
echo Hello World | $supernova gradient '#FF0000' '#FF7F00' '#FFFF00' '#00FF00'
echo Hello World | $supernova gradient 'Honey' 'Bolognese'
