(local supernova (require :supernova))

; ## Colon Smart Operator (Fennel)

(supernova:disable)

; It will print colors and styles:
(print (supernova.italic.red "Hello World"))
(print (supernova.color "Hello World" "#D52222"))

; It will NOT print colors or styles:
(print (supernova.italic:red "Hello World"))
(print (supernova:color "Hello World" "#D52222"))

(supernova:enable)

; It will print colors and styles:
(print (supernova.italic.red "Hello World"))
(print (supernova.color "Hello World" "#D52222"))

; It will print colors and styles:
(print (supernova.italic:red "Hello World"))
(print (supernova:color "Hello World" "#D52222"))

; ### Color Support (Fennel)

(supernova:set-colors "true-color")

(print (supernova:color "Hello World" "#D52222"))

(supernova:set-colors 256)

(print (supernova:color "Hello World" "#D52222"))

(supernova:set-colors 8)

(print (supernova:color "Hello World" "#D52222"))
