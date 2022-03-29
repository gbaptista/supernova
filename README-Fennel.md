# Supernova

Terminal string styling. Put some color in your console!

<div align="center">
  <img alt="Photo of the Veil Nebula from the Hubble Space Telescope." src="https://github.com/gbaptista/supernova/blob/main/images/header.png">
</div>
<div align="right">
  <small><em>
    Veil Nebula | <a href="https://hubblesite.org/contents/media/images/2007/30/2167-Image.html">hubblesite.org</a>
  </em></small>
</div>

## Fennel

> _"Fennel is a programming language that brings together the speed, simplicity, and reach of Lua with the flexibility of a lisp syntax and macro system." [fennel-lang.org](https://fennel-lang.org)_

```clj
(local supernova (require :supernova))

(print (supernova.italic.yellow "WARNING: Intense color found."))
(print (supernova.underline.color "Beautiful pink." "#e317e0"))

(print (supernova.gradient
        "Reflection, refraction and dispersion."
        ["#FF0000" "#FFFF00" "#00FF00" "#0FF0FE" "#233CFE"]))
```

![Screenshot of a Terminal containing texts with several foreground colors.](https://github.com/gbaptista/supernova/blob/main/images/demo.png)

- [Installing](#installing-fennel)
- [Helpers](#helpers-fennel)
- [Styles](#styles-fennel)
  - [Common](#common-styles-fennel)
  - [All](#all-styles-fennel)
- [Foreground Colors](#foreground-colors-fennel)
  - [SGR 8 Colors (3/4 bit)](#sgr-8-colors-34-bit-fennel)
  - [SGR 8 Bright Colors (3/4 bit)](#sgr-8-bright-colors-34-bit-fennel)
  - [SGR 256 Colors (8-bit)](#sgr-256-colors-8-bit-fennel)
  - [SGR True Color (24-bit)](#sgr-true-color-24-bit-fennel)
  - [SGR Gradient True Color (24-bit)](#sgr-gradient-true-color-24-bit-fennel)
- [Background Colors](#background-colors-fennel)
- [Underline Colors](#underline-colors-fennel)
- [Chains: Compounding Styles](#chains-compounding-styles-fennel)
  - [Nested Calls Warning](#nested-calls-warning-fennel)
- [Colon Smart Operator](#colon-smart-operator-fennel)
  - [Color Support](#color-support-fennel)
- [Themes](#themes-fennel)
  - [Custom Styles](#custom-styles-fennel)
    - [Adding Styles to the Default Theme](#adding-styles-to-the-default-theme-fennel)
    - [Adding Styles to a Custom Theme](#adding-styles-to-a-custom-theme-fennel)
  - [Custom Themes](#custom-themes-fennel)
    - [Adding a Custom Theme](#adding-a-custom-theme-fennel)
    - [Inspecting Themes](#inspecting-themes-fennel)

### Installing (Fennel)

To install through [fnx](https://github.com/gbaptista/fnx), add to your `.fnx.fnl`:

```fnl
:supernova {:lua/rock ">= 0.0.2"}

; Example:

{:name :my-project
 :version :0.0.1
 :dependencies {:supernova {:lua/rock ">= 0.0.2"}}}
```

### Helpers (Fennel)

```clj
(local supernova (require :supernova))

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
```

### Styles (Fennel)

#### Common Styles (Fennel)

Style support depends on your [platform](https://en.wikipedia.org/wiki/ANSI_escape_code#Platform_support). The most common styles that usually works everywhere are:

```clj
(local supernova (require :supernova))

(print (supernova.bold "bold"))
(print (supernova.italic "italic"))
(print (supernova.underline "underline"))

(print (supernova.crossed-out "crossed-out"))
(print (supernova.strike "strike"))
(print (supernova.reverse "reverse"))
(print (supernova.invert "invert"))

(print (supernova.blink "blink"))
(print (supernova.slow-blink "slow-blink"))

(print (supernova.overlined "overlined"))

(print (supernova.hide "hide"))
```

#### All Styles (Fennel)

- `blink` `bold` `conceal` `crossed-out` `doubly` `doubly-underline` `encircled` `faint` `fraktur` `framed` `hide` `invert` `italic` `overlined` `proportional` `proportional-spacing` `rapid-blink` `reset` `reveal` `reverse` `reverse-video` `slow-blink` `spacing` `strike` `subscript` `superscript` `underline`
- `blink-off` `bold-off` `crossed-out-off` `encircled-off` `fraktur-off` `framed-off` `invert-off` `italic-off` `overlined-off` `proportional-off` `proportional-spacing-off` `reverse-off` `spacing-off` `strike-off` `underline-off` 

### Foreground Colors (Fennel)

#### SGR 8 Colors (3/4 bit) (Fennel)
```clj
(local supernova (require :supernova))

(print (supernova.black "Hello World"))
(print (supernova.blue "Hello World"))
(print (supernova.cyan "Hello World"))
(print (supernova.green "Hello World"))
(print (supernova.magenta "Hello World"))
(print (supernova.red "Hello World"))
(print (supernova.white "Hello World"))
(print (supernova.yellow "Hello World"))
```

#### SGR 8 Bright Colors (3/4 bit) (Fennel)
```clj
(local supernova (require :supernova))

(print (supernova.bright-black "Hello World"))
(print (supernova.gray "Hello World")) ; same as bright-black

(print (supernova.bright-blue "Hello World"))
(print (supernova.bright-cyan "Hello World"))
(print (supernova.bright-green "Hello World"))
(print (supernova.bright-magenta "Hello World"))
(print (supernova.bright-red "Hello World"))
(print (supernova.bright-white "Hello World"))
(print (supernova.bright-yellow "Hello World"))
```

#### SGR 256 Colors (8-bit) (Fennel)

```clj
(local supernova (require :supernova))

(print (supernova.color "Hello World" 1))
(print (supernova.color "Hello World" 2))
(print (supernova.color "Hello World" 3))
; ...
(print (supernova.color "Hello World" 253))
(print (supernova.color "Hello World" 255))
(print (supernova.color "Hello World" 256))
```

#### SGR True Color (24-bit) (Fennel)

```clj
(local supernova (require :supernova))

(print (supernova.color "Hello World" "#34a2eb")) ; Hex
(print (supernova.color "Hello World" [235 52 223])) ; RGB
(print (supernova.color "Hello World" "Honey")) ; Name
```

#### SGR Gradient True Color (24-bit) (Fennel)

```clj
(local supernova (require :supernova))

(print (supernova.gradient "Hello World" ["#eb3434" "#343aeb"]))
(print (supernova.gradient "Hello World" ["#FF0000" "#FF7F00" "#FFFF00" "#00FF00"]))
(print (supernova.gradient "Hello World" ["Honey" "Bolognese"]))
```

## Background Colors (Fennel)

Follows the same rules of _Foreground Colors_:

```clj
(local supernova (require :supernova))

(print (supernova.bg-blue "Hello World"))
(print (supernova.bg-bright-red "Hello World"))
(print (supernova.background-blue "Hello World"))
(print (supernova.background-bright-red "Hello World"))

(print (supernova.bg "Hello World" 253))
(print (supernova.background "Hello World" 255))
(print (supernova.background "Hello World" "#34a2eb"))
(print (supernova.background "Hello World" "Honey"))

(print (supernova.bg-gradient "Hello World" ["#eb3434" "#343aeb"]))
(print (supernova.background-gradient "Hello World" ["#343aeb" "#eb3434"]))
```

## Underline Colors (Fennel)

> _Rarely supported._

```clj
(local supernova (require :supernova))

(print (supernova.underline-color "Hello World" 255))
(print (supernova.underline-color "Hello World" "#34a2eb"))
(print (supernova.underline-color "Hello World" "Honey"))
```

## Chains: Compounding Styles (Fennel)

You can compose as many styles as you like. The only rule is: You can have only one style with parameters per chain, and it must be the last one:

```clj
(local supernova (require :supernova))

(print (supernova.italic.red.underline "Hello World"))
(print (supernova.yellow.bold.bg-blue.strike "Hello World"))
(print (supernova.bold.bg-red.underline.color "Hello World" "#34a2eb"))
(print (supernova.italic.color "Hello World" "Deep Sky Blue"))
```

If you need to compose two styles that depend on parameters, you probably need [Custom Styles](#custom-styles-fennel).

### Nested Calls Warning (Fennel)

Avoid nested calls; they won't work as you probably expect:

```clj
(local supernova (require :supernova))

; Don't do that:
(print (supernova.bold.color (supernova.italic.bg "Hello World" "#0fd447") "#ed3d0c"))
```

Use [Custom Styles](#custom-styles-fennel) instead.

## Colon Smart Operator (Fennel)

The `:` operator indicates that _supernova_ will attempt to act smartly: If you try to print an RGB color on a terminal with eight color support, it will use the closest color within the eight supported ones. Also, it gives the possibility to disable the use of colors and styles altogether.

Note that the `:` operator must be used only in the last part of your call:

```clj
(local supernova (require :supernova))

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
```

### Color Support (Fennel)

Five color modes are supported: `true-color` `256` `16` `8` `0`

By default, _supernova_ tries to identify your terminal support and performs the necessary color adaptations with the  `:` operator.

You can use an environment variable (`SUPERNOVA_COLORS`) to force a color mode, or manually define it with `:set-colors`:

```clj
(local supernova (require :supernova))

(supernova:set-colors "true-color")

(print (supernova:color "Hello World" "#D52222"))

(supernova:set-colors 256)

(print (supernova:color "Hello World" "#D52222"))

(supernova:set-colors 8)

(print (supernova:color "Hello World" "#D52222"))
```

## Themes (Fennel)

You can use themes by prefixing your calls with the theme name:

```clj
(local supernova (require :supernova))

(print (supernova.default.red "Hello World"))
(print (supernova.custom-theme-name.red "Hello World"))
(print (supernova.custom-theme-name.custom-style "Hello World"))
```

You can also define the default theme to be used globally:

```clj
(local supernova (require :supernova))

(supernova:set-theme :my-custom-theme)

(print (supernova.my-custom-style "Hello World"))
```

### Custom Styles (Fennel)

You can add styles to the default theme or a custom theme. You can also use previously defined styles as references for new styles.

#### Adding Styles to the Default Theme (Fennel):

```clj
(local supernova (require :supernova))

(let [style (supernova:register :intense)]
  (style.italic.bold.underline.bright-magenta))

(let [style (supernova:register :warning :default)]
  (style.italic.color :#ffa200))

(let [style (supernova:register :super-warning)]
  (style.warning.bold.underline))

(print (supernova.intense "intense"))
(print (supernova.warning "warning"))
(print (supernova.super-warning "super-warning"))
```

#### Adding Styles to a Custom Theme (Fennel):

```clj
(local supernova (require :supernova))

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
```

### Custom Themes (Fennel)

#### Adding a Custom Theme (Fennel):

When you enter an array of colors, names will be automatically generated for each color. Also, a `rainbow` style is created with the colors:

```clj
(local supernova (require :supernova))

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
```

#### Inspecting Themes (Fennel):

You can check all styles defined for a theme:

```clj
(local supernova (require :supernova))

(let [theme (supernova:get-theme :default)]
  (print (.. "Theme: " theme.identifier))
  (each [_ style (pairs theme.styles)]
        (print (.. " - " style))))
```
