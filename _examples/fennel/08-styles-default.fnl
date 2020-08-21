(local supernova (require :supernova))

; ## Themes (Fennel)

; ### Custom Styles (Fennel)

(let [style (supernova:register :intense)]
  (style.italic.bold.underline.bright-magenta))

(let [style (supernova:register :warning :default)]
  (style.italic.color :#ffa200))

(let [style (supernova:register :super-warning)]
  (style.warning.bold.underline))

(print (supernova.intense "intense"))
(print (supernova.warning "warning"))
(print (supernova.super-warning "super-warning"))
