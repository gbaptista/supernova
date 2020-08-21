(local supernova (require :supernova))

; ## Themes (Fennel)

; ### Custom Themes (Fennel)

(local love-theme
       {:identifier :love
        :author "Robert Indiana"
        :colors [:#2659D8 :#1C6FF3 :#5EBC4E :#53A946 :#F24534]
        :styles {
          :intense (supernova.style.italic.underline.bright-yellow)
          :bluetiful (supernova.style.color :#3C69E7)}})

(let [theme (supernova:register love-theme)]
  (print (.. "Theme: " theme.identifier))
  (each [_ style (pairs theme.styles)]
        (print (.. " - " style))))

(print (supernova.love.muted-green "muted-green"))
(print (supernova.love.bluetiful "bluetiful"))
(print (supernova.love.intense "intense"))

(print (supernova.love.rainbow "Lorem ipsum dolor sit amet."))
