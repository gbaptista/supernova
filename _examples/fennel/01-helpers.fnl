(local supernova (require :supernova))

; ### Helpers (Fennel)

(print (supernova.name :#34a2eb))
(print (supernova.name [52 162 235]))

(let [hex :#34a2eb]
  (each [_ name (pairs (supernova.names hex))]
        (print (.. "Name for " hex ": " name))))

(let [rgb [224 53 40]
      hex (supernova.rgb-to-hex rgb)]
  (each [_ name (pairs (supernova.names rgb))]
        (print (.. "Name for " hex ": " name))))

(let [rgb (supernova.hex-to-rgb :#34a2eb)]
  (print (..
          "#34a2eb > "
          "Red: " (. rgb 1)
          " Green: " (. rgb 2)
          " Blue: " (. rgb 3))))

(let [rgb (supernova.to-rgb "Fox")]
  (print (..
          "Fox > "
          "Red: " (. rgb 1)
          " Green: " (. rgb 2)
          " Blue: " (. rgb 3))))
