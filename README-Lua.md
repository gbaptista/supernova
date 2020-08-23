# Supernova

Terminal string styling. Put some color in your console!

<div align="center">
  <img alt="Photo of the Veil Nebula from the Hubble Space Telescope." src="https://github.com/gbaptista/supernova/blob/master/images/header.png">
</div>
<div align="right">
  <small><em>
    Veil Nebula | <a href="https://hubblesite.org/contents/media/images/2007/30/2167-Image.html">hubblesite.org</a>
  </em></small>
</div>

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

![Screenshot of a Terminal containing texts with several foreground colors.](https://github.com/gbaptista/supernova/blob/master/images/demo.png)

- [Helpers](#helpers-lua)
- [Styles](#styles-lua)
  - [Common](#common-styles-lua)
  - [All](#all-styles-lua)
- [Foreground Colors](#foreground-colors-lua)
  - [SGR 8 Colors (3/4 bit)](#sgr-8-colors-34-bit-lua)
  - [SGR 8 Bright Colors (3/4 bit)](#sgr-8-bright-colors-34-bit-lua)
  - [SGR 256 Colors (8-bit)](#sgr-256-colors-8-bit-lua)
  - [SGR True Color (24-bit)](#sgr-true-color-24-bit-lua)
  - [SGR Gradient True Color (24-bit)](#sgr-gradient-true-color-24-bit-lua)
- [Background Colors](#background-colors-lua)
- [Underline Colors](#underline-colors-lua)
- [Chains: Compounding Styles](#chains-compounding-styles-lua)
  - [Nested Calls Warning](#nested-calls-warning-lua)
- [Colon Smart Operator](#colon-smart-operator-lua)
  - [Color Support](#color-support-lua)
- [Themes](#themes-lua)
  - [Custom Styles](#custom-styles-lua)
    - [Adding Styles to the Default Theme](#adding-styles-to-the-default-theme-lua)
    - [Adding Styles to a Custom Theme](#adding-styles-to-a-custom-theme-lua)
  - [Custom Themes](#custom-themes-lua)
    - [Adding a Custom Theme](#adding-a-custom-theme-lua)
    - [Inspecting Themes](#inspecting-themes-lua)

### Helpers (Lua)

```lua
local supernova = require 'supernova'

print(supernova.name('#34a2eb'))
print(supernova.name({ 52, 162, 235 }))

do local hex = '#34a2eb'
  for _, name in pairs(supernova.names(hex)) do
    print('Name for ' .. hex .. ': ' .. name)
  end
end

do local rgb = { 224, 53, 40 }
   local hex = supernova.rgb_to_hex(rgb)

  for _, name in pairs(supernova.names(rgb)) do
    print('Name for ' .. hex .. ': ' .. name)
  end
end

do local rgb = supernova.hex_to_rgb('#34a2eb')
  print(
    '#34a2eb > ' ..
    'Red: ' .. rgb[1] .. ' Green:' .. rgb[2] .. ' Blue:' .. rgb[3]
  )
end

do local rgb = supernova.to_rgb('Fox')
  print(
    'Fox > ' ..
    'Red: ' .. rgb[1] .. ' Green:' .. rgb[2] .. ' Blue:' .. rgb[3]
  )
end
```

### Styles (Lua)

#### Common Styles (Lua)

Style support depends on your [platform](https://en.wikipedia.org/wiki/ANSI_escape_code#Platform_support). The most common styles that usually works everywhere are:

```lua
local supernova = require 'supernova'

print(supernova.bold('bold'))
print(supernova.italic('italic'))
print(supernova.underline('underline'))

print(supernova.crossed_out('crossed_out'))
print(supernova.strike('strike'))
print(supernova.reverse('reverse'))
print(supernova.invert('invert'))

print(supernova.blink('blink'))
print(supernova.slow_blink('slow_blink'))

print(supernova.overlined('overlined'))

print(supernova.hide('hide'))
```

#### All Styles (Lua)

- `blink` `bold` `conceal` `crossed_out` `doubly` `doubly_underline` `encircled` `faint` `fraktur` `framed` `hide` `invert` `italic` `overlined` `proportional` `proportional_spacing` `rapid_blink` `reset` `reveal` `reverse` `reverse_video` `slow_blink` `spacing` `strike` `subscript` `superscript` `underline`
- `blink_off` `bold_off` `crossed_out_off` `encircled_off` `fraktur_off` `framed_off` `invert_off` `italic_off` `overlined_off` `proportional_off` `proportional_spacing_off` `reverse_off` `spacing_off` `strike_off` `underline_off` 

### Foreground Colors (Lua)

#### SGR 8 Colors (3/4 bit) (Lua)
```lua
local supernova = require 'supernova'

print(supernova.black('Hello World'))
print(supernova.blue('Hello World'))
print(supernova.cyan('Hello World'))
print(supernova.green('Hello World'))
print(supernova.magenta('Hello World'))
print(supernova.red('Hello World'))
print(supernova.white('Hello World'))
print(supernova.yellow('Hello World'))
```

#### SGR 8 Bright Colors (3/4 bit) (Lua)
```lua
local supernova = require 'supernova'

print(supernova.bright_black('Hello World'))
print(supernova.gray('Hello World')) -- same as bright-black

print(supernova.bright_blue('Hello World'))
print(supernova.bright_cyan('Hello World'))
print(supernova.bright_green('Hello World'))
print(supernova.bright_magenta('Hello World'))
print(supernova.bright_red('Hello World'))
print(supernova.bright_white('Hello World'))
print(supernova.bright_yellow('Hello World'))
```

#### SGR 256 Colors (8-bit) (Lua)

```lua
local supernova = require 'supernova'

print(supernova.color('Hello World', 1))
print(supernova.color('Hello World', 2))
print(supernova.color('Hello World', 3))
-- ...
print(supernova.color('Hello World', 253))
print(supernova.color('Hello World', 255))
print(supernova.color('Hello World', 256))
```

#### SGR True Color (24-bit) (Lua)

```lua
local supernova = require 'supernova'

print(supernova.color('Hello World', '#34a2eb')) -- Hex
print(supernova.color('Hello World', { 235, 52, 223 })) -- RGB
print(supernova.color('Hello World', 'Honey')) -- Name
```

#### SGR Gradient True Color (24-bit) (Lua)

```lua
local supernova = require 'supernova'

print(supernova.gradient('Hello World', { '#eb3434', '#343aeb'}))
print(supernova.gradient('Hello World', { '#FF0000', '#FF7F00', '#FFFF00', '#00FF00' }))
print(supernova.gradient('Hello World', { 'Honey', 'Bolognese'}))
```

## Background Colors (Lua)

Follows the same rules of _Foreground Colors_:

```lua
local supernova = require 'supernova'

print(supernova.bg_blue('Hello World'))
print(supernova.bg_bright_red('Hello World'))
print(supernova.background_blue('Hello World'))
print(supernova.background_bright_red('Hello World'))

print(supernova.bg('Hello World', 253))
print(supernova.background('Hello World', 255))
print(supernova.background('Hello World', '#34a2eb'))
print(supernova.background('Hello World', 'Honey'))

print(supernova.bg_gradient('Hello World', { '#eb3434', '#343aeb' }))
print(supernova.background_gradient('Hello World', {'#343aeb', '#eb3434' }))

```

## Underline Colors (Lua)

> _Rarely supported._

```lua
local supernova = require 'supernova'

print(supernova.underline_color('Hello World', 255))
print(supernova.underline_color('Hello World', '#34a2eb'))
print(supernova.underline_color('Hello World', 'Honey'))

```

## Chains: Compounding Styles (Lua)

You can compose as many styles as you like. The only rule is: You can have only one style with parameters per chain, and it must be the last one:

```lua
local supernova = require 'supernova'

print(supernova.italic.red.underline('Hello World'))
print(supernova.yellow.bold.bg_blue.strike('Hello World'))
print(supernova.bold.bg_red.underline.color('Hello World', '#34a2eb'))
print(supernova.italic.color('Hello World', 'Deep Sky Blue'))
```

If you need to compose two styles that depend on parameters, you probably need [Custom Styles](#custom-styles-lua).

### Nested Calls Warning (Lua)

Avoid nested calls; they won't work as you probably expect:

```lua
local supernova = require 'supernova'

-- Don't do that:
print(supernova.bold.color(
  supernova.italic.bg('Hello World', '#0fd447'), '#ed3d0c'
))
```

Use [Custom Styles](#custom-styles-lua) instead.

## Colon Smart Operator (Lua)

The `:` operator indicates that _supernova_ will attempt to act smartly: If you try to print an RGB color on a terminal with eight color support, it will use the closest color within the eight supported ones. Also, it gives the possibility to disable the use of colors and styles altogether.

Note that the `:` operator must be used only in the last part of your call:

```lua
local supernova = require 'supernova'

supernova:disable()

-- It will print colors and styles:
print(supernova.italic.red('Hello World'))
print(supernova.color('Hello World', '#D52222'))

-- It will NOT print colors or styles:
print(supernova.italic:red('Hello World'))
print(supernova:color('Hello World', '#D52222'))

supernova:enable()

-- It will print colors and styles:
print(supernova.italic.red('Hello World'))
print(supernova.color('Hello World', '#D52222'))

-- It will print colors and styles:
print(supernova.italic:red('Hello World'))
print(supernova:color('Hello World', '#D52222'))
```

### Color Support (Lua)

Five color modes are supported: `true_color` `256` `16` `8` `0`

By default, _supernova_ tries to identify your terminal support and performs the necessary color adaptations with the  `:` operator.

You can use an environment variable (`SUPERNOVA_COLORS`) to force a color mode, or manually define it with `:set_colors`:

```lua
supernova:set_colors('true_color')

print(supernova:color('Hello World', '#D52222'))

supernova:set_colors(256)

print(supernova:color('Hello World', '#D52222'))

supernova:set_colors(8)

print(supernova:color('Hello World', '#D52222'))

```

## Themes (Lua)

You can use themes by prefixing your calls with the theme name:

```lua
local supernova = require 'supernova'

print(supernova.default.red('Hello World'))
print(supernova.custom_theme_name.red('Hello World'))
print(supernova.custom_theme_name.custom_style('Hello World'))
```

You can also define the default theme to be used globally:

```lua
local supernova = require 'supernova'

supernova:set_theme('my_custom_theme')

print(supernova.my_custom_style('Hello World'))
```

### Custom Styles (Lua)

You can add styles to the default theme or a custom theme. You can also use previously defined styles as references for new styles.

#### Adding Styles to the Default Theme (Lua):

```lua
local supernova = require 'supernova'

supernova:register(
  'intense'
).italic.bold.underline.bright_magenta()

supernova:register('warning').italic.color('#ffa200')

supernova:register('super_warning').warning.bold.underline()

print(supernova.intense('intense'))
print(supernova.warning('warning'))
print(supernova.super_warning('super_warning'))
```

#### Adding Styles to a Custom Theme (Lua):

```lua
local supernova = require 'supernova'

supernova:register(
  'intense', 'my_custom_theme'
).italic.bold.underline.bright_magenta()

supernova:register(
  'warning', 'my_custom_theme'
).italic.color('#ffa200')

supernova:register(
  'super_warning', 'my_custom_theme'
).warning.bold.underline()

print(supernova.my_custom_theme.intense('intense'))
print(supernova.my_custom_theme.warning('warning'))
print(supernova.my_custom_theme.super_warning('super_warning'))

supernova:set_theme('my_custom_theme')

print(supernova.intense('intense'))
print(supernova.warning('warning'))
print(supernova.super_warning('super_warning'))
```

### Custom Themes (Lua)

#### Adding a Custom Theme (Lua):

When you enter an array of colors, names will be automatically generated for each color. Also, a `rainbow` style is created with the colors:

```lua
local supernova = require 'supernova'

local love_theme = {
  identifier = 'love',
  author = 'Robert Indiana',
  colors = { '#2659D8', '#1C6FF3', '#5EBC4E', '#53A946', '#F24534' },
  styles = {
    intense = supernova.style.italic.underline.bright_yellow(),
    bluetiful = supernova.style.color('#3C69E7')
  }
}

local theme = supernova:register(love_theme)

print('Theme: ' .. theme.identifier)

for _, style in pairs(theme.styles) do
  print(' - ' .. style)
end


print(supernova.love.muted_green('muted_green'))
print(supernova.love.bluetiful('bluetiful'))
print(supernova.love.intense('intense'))

print(supernova.love.rainbow('Lorem ipsum dolor sit amet.'))
```

#### Inspecting Themes (Lua):

You can check all styles defined for a theme:

```lua
local supernova = require 'supernova'

local theme = supernova:get_theme('default')

print('Theme: ' .. theme.identifier)

for _, style in pairs(theme.styles) do
  print(' - ' .. style)
end
```
