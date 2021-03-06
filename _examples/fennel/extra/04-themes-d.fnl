(local supernova (require :supernova))

(local my-custom-theme
       {:identifier :love
        :author "Robert Indiana"
        :styles {
         :intense (supernova.style.italic.underline.bright-yellow)
         :bluetiful (supernova.style.color :#3C69E7)}})

(let [theme (supernova:register my-custom-theme)]
  (print (.. "Theme: " theme.identifier))
  (each [_ style (pairs theme.styles)]
        (print (.. " - " style))))

(print (supernova.love.bluetiful "bluetiful"))
(print (supernova.love.intense "intense"))
