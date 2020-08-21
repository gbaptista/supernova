(local supernova (require :supernova))

(let [theme (supernova:register
             {:identifier :love
              :author "Robert Indiana"
              :colors [:#2659D8 :#1C6FF3 :#5EBC4E :#53A946 :#F24534]})]
  (print theme.identifier)
  (each [_ style (pairs theme.styles)]
        (print (.. "style: " style))))


(print (supernova.love.bluetiful "bluetiful"))
(print (supernova.love.rainbow "rainbow: Lorem ipsum dolor sit amet."))

(supernova:set-theme :love)

(print (supernova.deep-sky-blue "deep-sky-blue"))
(print (supernova.cascara "cascara"))
(print (supernova.muted-green "muted-green"))
(print (supernova.bluetiful "bluetiful"))
(print (supernova.golf-course "golf-course"))

(print (supernova.rainbow "rainbow: Lorem ipsum dolor sit amet."))
