(local supernova (require :supernova))

; ## Background Colors (Fennel)

(print (supernova.bg-blue "Hello World"))
(print (supernova.bg-bright-red "Hello World"))
(print (supernova.background-blue "Hello World"))
(print (supernova.background-bright-red "Hello World"))

(print (supernova.bg "Hello World" 253))
(print (supernova.background "Hello World" 255))
(print (supernova.background "Hello World" "#34a2eb"))
(print (supernova.background "Hello World" "Honey"))

(print (supernova.bg-gradient "Hello World" ["#eb3434" "#343aeb"]))
(print (supernova.background-gradient "Hello World" ["#343aeb" "#eb3434"]))
