source _examples/shell/supernova.sh

## Colon Smart Operator (Shell)

echo Hello World | $supernova :underline.red
echo Hello World | $supernova :blue
echo Hello World | $supernova :bold.color '#343aeb'


### Color Support (Shell)# 
echo Hello World | SUPERNOVA_COLORS=true-color $supernova :color '#D52222'
echo Hello World | SUPERNOVA_COLORS=256 $supernova :color '#D52222'
echo Hello World | SUPERNOVA_COLORS=16 $supernova :color '#D52222'
echo Hello World | SUPERNOVA_COLORS=8 $supernova :color '#D52222'
echo Hello World | SUPERNOVA_COLORS=0 $supernova :color '#D52222'
