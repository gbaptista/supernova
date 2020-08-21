(local supernova (require :supernova))

(print (supernova.default.red "Hello World"))
(print (supernova.custom-theme-name.red "Hello World"))
(print (supernova.custom-theme-name.custom-style "Hello World"))

;

(supernova:set-theme :my-custom-theme)

(print (supernova.my-custom-style "Hello World"))
