# Supernova

![Fennel 0.5 on Lua 5.1](https://github.com/gbaptista/supernova/workflows/Fennel%200.5%20on%20Lua%205.1/badge.svg) ![Fennel 0.5 on Lua 5.2](https://github.com/gbaptista/supernova/workflows/Fennel%200.5%20on%20Lua%205.2/badge.svg) ![Fennel 0.5 on Lua 5.3](https://github.com/gbaptista/supernova/workflows/Fennel%200.5%20on%20Lua%205.3/badge.svg) ![Fennel 0.5 on Lua 5.4](https://github.com/gbaptista/supernova/workflows/Fennel%200.5%20on%20Lua%205.4/badge.svg)

Terminal string styling. Put some color in your console! Support for Fennel, Lua, and Shell.

<div align="center">
  <img alt="Photo of the Veil Nebula from the Hubble Space Telescope." src="https://github.com/gbaptista/supernova/blob/main/images/header.png">
</div>
<div align="right">
  <small><em>
    Veil Nebula | <a href="https://hubblesite.org/contents/media/images/2007/30/2167-Image.html">hubblesite.org</a>
  </em></small>
  <br><br>
</div>

```bash
fortune | cowsay | supernova
```

![Quote by Richard Feynman in different foreground colors and an illustration of a cow.](https://github.com/gbaptista/supernova/blob/main/images/rainbow.png)

- Flavors:
  - [Fennel](#fennel)
  - [Lua](#lua)
  - [Shell](#shell)
- [Installing](#installing)
  - [Installing for Fennel](#installing-for-fennel)
- [Principles](#principles)
  - [Portability](#1-portability)
- [Room for Improvement](#room-for-improvement)
  - [Chaining](#room-for-improvement)
  - [Color Proximity](#color-proximity)
  - [Gradient](#gradient)
  - [VGA Mode 13h](#vga-mode-13h)
  - [Packages](#packages)
- [Contributing](#contributing)
  - [Style Guide](#style-guide)
- [Acknowledgments](#acknowledgments)
- [References](#references)
- [Screenshots](#screenshots)

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

Check the complete [documentation for the Fennel library](https://github.com/gbaptista/supernova/blob/main/README-Fennel.md).

## Lua

```lua
local supernova = require 'supernova'

print(supernova.italic.yellow('WARNING: Intense color found.'))
print(supernova.underline.color('Beautiful pink.', '#e317e0'))

print(supernova.gradient(
  'Reflection, refraction and dispersion.',
  { '#FF0000', '#FFFF00', '#00FF00', '#0FF0FE', '#233CFE' }
))
```

![Screenshot of a Terminal containing texts with several foreground colors.](https://github.com/gbaptista/supernova/blob/main/images/demo.png)

Check the complete [documentation for the Lua library](https://github.com/gbaptista/supernova/blob/main/README-Lua.md).

## Shell

```bash
supernova inspect '#eb4934'
```

![Screenshot of a Terminal containing information about the Cascara color.](https://github.com/gbaptista/supernova/blob/main/images/inspect.png)

```bash
echo WARNING: Intense color found. | supernova italic.yellow
echo Beautiful pink. | supernova underline.color '#e317e0'

echo Reflection, refraction and dispersion. | \
  supernova gradient \
  '#FF0000' '#FFFF00' '#00FF00' '#0FF0FE' '#233CFE'
```

![Screenshot of a Terminal containing texts with several foreground colors.](https://github.com/gbaptista/supernova/blob/main/images/demo.png)

Check the complete [documentation for the Shell CLI](https://github.com/gbaptista/supernova/blob/main/README-Shell.md).

## Installing

Ensure that you have [Lua](https://www.lua.org/start.html) and [LuaRocks](https://github.com/luarocks/luarocks/wiki/Download) installed.

Installation through _LuaRocks_:

**Installing for the user (recommended):**
```bash
luarocks install supernova --local
```

**Installing for the system:**
```bash
sudo luarocks install supernova
```

### Installing for Fennel

To install through [fnx](https://github.com/gbaptista/fnx), add to your `.fnx.fnl`:
```fnl
:supernova {:lua/rock ">= 0.0.2"}

; Example:

{:name    "my-project"
 :version "0.0.1"

 :dependencies
   {:supernova {:lua/rock ">= 0.0.2"}}}
```

## Principles

This project is a spark towards a higher purpose. There are principles to ensure that we are on track. These principles should help with discussions and decision making:

### 1) Portability

There must be no external dependencies other than Lua. There must be no need to use LuaJIT or any special implementation than the standard Lua. The code must work on any platform where it is possible to run Lua.

Maintainers' priority in the pursuit of this principle:

1) Free Software and Free Hardware
2) Open Source Software and Open Source Hardware
3) Proprietary Software and Proprietary Hardware

## Room for Improvement

### Chaining

The current strategy with _metatables_ has its flaws. You can explore the problem by analyzing these samples of code:

- [chains/example.fnl](https://git.sr.ht/~gbaptista/shortcodes/tree/main/item/chains/example.fnl)
- [chains/example.lua](https://git.sr.ht/~gbaptista/shortcodes/tree/main/item/chains/example.lua)

### Color Proximity

The math for the distance between two colors ain't flawless. We can do better. Current code:

```lua
local distance = (
  ((rgb_color[1] - cadidate_color.rgb[1]) ^ 2) +
  ((rgb_color[2] - cadidate_color.rgb[2]) ^ 2) +
  ((rgb_color[3] - cadidate_color.rgb[3]) ^ 2)
)
```

### Gradient

We have a naive approach for gradient generation. Other algorithms could produce better results: [_Color gradient algorithm_](https://stackoverflow.com/questions/22607043/color-gradient-algorithm)

Current code:
```lua
local color = {
  math.floor((from_rgb[1] * (1 - mix)) + (to_rgb[1] * mix)),
  math.floor((from_rgb[2] * (1 - mix)) + (to_rgb[2] * mix)),
  math.floor((from_rgb[3] * (1 - mix)) + (to_rgb[3] * mix))
}
```

### VGA Mode 13h

The current [256 VGA color representation](https://github.com/gbaptista/supernova/blob/main/supernova/core/reductor/256_vga.lua) may not be accurate enough. Some references that are worth exploring:
- [vgapal](https://github.com/canidlogic/vgapal)
- [Mode 13h](https://en.wikipedia.org/wiki/Mode_13h)

### Packages

We currently only have _luarocks_ packages. We have some experiments with standalone binaries and AUR packages that could be released.

## Contributing

### Style Guide

We ensure that [Luacheck](https://github.com/mpeterv/luacheck) is valid for any Pull Request or commit.

Also, we follow the [_Olivine Labs' Lua Style Guide_](https://github.com/Olivine-Labs/lua-style-guide). The [_LuaRocks' Lua Style Guide_](https://github.com/luarocks/lua-style-guide) is a great reference as well. If their suggestions conflict with each other, the _Olivine Labs' Guide_ prevails.

## Acknowledgments

The names for the colors come from the [color-names](https://github.com/meodai/color-names) project.


## References
- https://en.wikipedia.org/wiki/ANSI_escape_code
- https://codepen.io/meodai/full/zdgXJj/
- https://gist.github.com/XVilka/8346728
