(local supernova (require :supernova))

; ## Themes (Fennel)

; ### Custom Themes (Fennel)

(let [theme (supernova:get-theme :default)]
  (print (.. "Theme: " theme.identifier))
  (each [_ style (pairs theme.styles)]
        (print (.. " - " style))))
