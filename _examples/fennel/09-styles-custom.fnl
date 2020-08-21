(local supernova (require :supernova))

; ## Themes (Fennel)

; ### Custom Styles (Fennel)

(let [style (supernova:register :intense :my-custom-theme)]
  (style.italic.bold.underline.bright-magenta))

(let [style (supernova:register :warning :my-custom-theme)]
  (style.italic.color :#ffa200))

(let [style (supernova:register :super-warning :my-custom-theme)]
  (style.warning.bold.underline))

(print (supernova.my-custom-theme.intense "intense"))
(print (supernova.my-custom-theme.warning "warning"))
(print (supernova.my-custom-theme.super-warning "super-warning"))

(supernova:set-theme :my-custom-theme)

(print (supernova.intense "intense"))
(print (supernova.warning "warning"))
(print (supernova.super-warning "super-warning"))
