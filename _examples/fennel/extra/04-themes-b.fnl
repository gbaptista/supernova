(local supernova (require :supernova))

(let [style (supernova:register :intense)]
  (style.italic.bold.underline.bright-magenta))

(let [style (supernova:register :info :log)]
  (style.green))

(let [style (supernova:register :error :log)]
  (style.bold.red))

(let [style (supernova:register :warning :log)]
  (style.italic.color :#ffa200))

(print (supernova.intense "intense"))

(print (supernova.log.info "info"))
(print (supernova.log.error "error"))

(supernova:set-theme :log)

(print (supernova.intense "intense"))

(print (supernova.info "info"))
(print (supernova.error "error"))
(print (supernova.warning "warning"))
