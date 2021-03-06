(local supernova (require :supernova))

; ### Foreground Colors (Fennel)

; #### SGR 8 Colors (3/4 bit) (Fennel)
(print (supernova.black "Hello World"))
(print (supernova.blue "Hello World"))
(print (supernova.cyan "Hello World"))
(print (supernova.green "Hello World"))
(print (supernova.magenta "Hello World"))
(print (supernova.red "Hello World"))
(print (supernova.white "Hello World"))
(print (supernova.yellow "Hello World"))

; #### SGR 8 Bright Colors (3/4 bit) (Fennel)
(print (supernova.bright-black "Hello World"))
(print (supernova.gray "Hello World")) ; same as bright-black

(print (supernova.bright-blue "Hello World"))
(print (supernova.bright-cyan "Hello World"))
(print (supernova.bright-green "Hello World"))
(print (supernova.bright-magenta "Hello World"))
(print (supernova.bright-red "Hello World"))
(print (supernova.bright-white "Hello World"))
(print (supernova.bright-yellow "Hello World"))

; #### SGR 256 Colors (8-bit) (Fennel)
(print (supernova.color "Hello World" 1))
(print (supernova.color "Hello World" 2))
(print (supernova.color "Hello World" 3))
; ...
(print (supernova.color "Hello World" 253))
(print (supernova.color "Hello World" 255))
(print (supernova.color "Hello World" 256))

; #### SGR True Color (24-bit) (Fennel)
(print (supernova.color "Hello World" "#34a2eb")) ; Hex
(print (supernova.color "Hello World" [235 52 223])) ; RGB
(print (supernova.color "Hello World" "Honey")) ; Name

; #### SGR Gradient True Color (24-bit) (Fennel)
(print (supernova.gradient "Hello World" ["#eb3434" "#343aeb"]))
(print (supernova.gradient "Hello World" ["#FF0000" "#FF7F00" "#FFFF00" "#00FF00"]))
(print (supernova.gradient "Hello World" ["Honey" "Bolognese"]))
