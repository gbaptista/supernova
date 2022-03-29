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

- [Default Random Rainbow](#default-random-rainbow-shell)
- [Helpers](#helpers-shell)
- [Styles](#styles-shell)
  - [Common](#common-styles-shell)
  - [All](#all-styles-shell)
- [Foreground Colors](#foreground-colors-shell)
  - [SGR 8 Colors (3/4 bit)](#sgr-8-colors-34-bit-shell)
  - [SGR 8 Bright Colors (3/4 bit)](#sgr-8-bright-colors-34-bit-shell)
  - [SGR 256 Colors (8-bit)](#sgr-256-colors-8-bit-shell)
  - [SGR True Color (24-bit)](#sgr-true-color-24-bit-shell)
  - [SGR Gradient True Color (24-bit)](#sgr-gradient-true-color-24-bit-shell)
- [Background Colors](#background-colors-shell)
- [Underline Colors](#underline-colors-shell)
- [Chains: Compounding Styles](#chains-compounding-styles-shell)
- [Colon Smart Operator](#colon-smart-operator-shell)
  - [Color Support](#color-support-shell)

### Default Random Rainbow (Shell)

```bash
echo Hello World | supernova
ls -la | supernova
```

### Helpers (Shell)

```bash
supernova name '#34a2eb'
supernova name 52 162 235

supernova hex-to-rgb '#34a2eb'
supernova rgb-to-hex 52 162 235
supernova to-rgb 'Fox'

supernova inspect '#34a2eb'
supernova inspect 52 162 235
supernova inspect 'Fox'
```

### Styles (Shell)

#### Common Styles (Shell)

Style support depends on your [platform](https://en.wikipedia.org/wiki/ANSI_escape_code#Platform_support). The most common styles that usually works everywhere are:

```bash
echo "bold"        | supernova bold
echo "italic"      | supernova italic
echo "underline"   | supernova underline

echo "crossed-out" | supernova crossed-out
echo "strike"      | supernova strike
echo "reverse"     | supernova reverse
echo "invert"      | supernova invert

echo "blink"       | supernova blink
echo "slow-blink"  | supernova slow-blink

echo "overlined"   | supernova overlined

echo "hide"        | supernova hide
```

#### All Styles (Shell)

- `blink` `bold` `conceal` `crossed-out` `doubly` `doubly-underline` `encircled` `faint` `fraktur` `framed` `hide` `invert` `italic` `overlined` `proportional` `proportional-spacing` `rapid-blink` `reset` `reveal` `reverse` `reverse-video` `slow-blink` `spacing` `strike` `subscript` `superscript` `underline`
- `blink-off` `bold-off` `crossed-out-off` `encircled-off` `fraktur-off` `framed-off` `invert-off` `italic-off` `overlined-off` `proportional-off` `proportional-spacing-off` `reverse-off` `spacing-off` `strike-off` `underline-off` 

### Foreground Colors (Shell)

#### SGR 8 Colors (3/4 bit) (Shell)
```bash
echo Hello World | supernova black
echo Hello World | supernova blue
echo Hello World | supernova cyan
echo Hello World | supernova green
echo Hello World | supernova magenta
echo Hello World | supernova red
echo Hello World | supernova white
echo Hello World | supernova yellow
```

#### SGR 8 Bright Colors (3/4 bit) (Shell)
```bash
echo Hello World | supernova bright-black
echo Hello World | supernova gray # same as bright-black

echo Hello World | supernova bright-blue
echo Hello World | supernova bright-cyan
echo Hello World | supernova bright-green
echo Hello World | supernova bright-magenta
echo Hello World | supernova bright-red
echo Hello World | supernova bright-white
echo Hello World | supernova bright-yellow
```

#### SGR 256 Colors (8-bit) (Shell)

```bash
echo Hello World | supernova color 1
echo Hello World | supernova color 2
echo Hello World | supernova color 3
# ...
echo Hello World | supernova color 253
echo Hello World | supernova color 255
echo Hello World | supernova color 256
```

#### SGR True Color (24-bit) (Shell)

```bash
echo Hello World | supernova color '#34a2eb' # Hex
echo Hello World | supernova color 235 52 223 # RGB
echo Hello World | supernova color 'Honey' # Name
```

#### SGR Gradient True Color (24-bit) (Shell)

```bash
echo Hello World | supernova gradient '#eb3434' '#343aeb'
echo Hello World | supernova gradient '#FF0000' '#FF7F00' '#FFFF00' '#00FF00'
echo Hello World | supernova gradient 'Honey' 'Bolognese'
```

## Background Colors (Shell)

Follows the same rules of _Foreground Colors_:

```bash
echo Hello World | supernova bg-blue
echo Hello World | supernova bg-bright-red
echo Hello World | supernova background-blue
echo Hello World | supernova background-bright-red

echo Hello World | supernova bg 253
echo Hello World | supernova background 255
echo Hello World | supernova background '#343aeb'
echo Hello World | supernova background 'Honey'

echo Hello World | supernova bg-gradient '#eb3434' '#343aeb'
echo Hello World | supernova background-gradient '#343aeb' '#eb3434'
```

## Underline Colors (Shell)

> _Rarely supported._

```bash
echo Hello World | supernova underline-color 255
echo Hello World | supernova underline-color '#343aeb'
echo Hello World | supernova underline-color 'Honey'
```

## Chains: Compounding Styles (Shell)

You can compose as many styles as you like. The only rule is: You can have only one style with parameters per chain, and it must be the last one:

```bash
echo Hello World | supernova italic.red.underline
echo Hello World | supernova yellow.bold.bg-blue.strike
echo Hello World | supernova bold.bg-red.underline.color '#34a2eb'
echo Hello World | supernova italic.color 'Deep Sky Blue'
```

If you need to compose two styles that depend on parameters, you can be creative with the `|` operator:

```bash
echo Hello World | supernova italic.bg '#0fd447' | supernova bold.color '#ed3d0c'
```

## Colon Smart Operator (Shell)

The `:` operator indicates that _supernova_ will attempt to act smartly: If you try to print an RGB color on a terminal with eight color support, it will use the closest color within the eight supported ones. You use it as a prefix in your calls:

```bash
echo Hello World | supernova :underline.red
echo Hello World | supernova :blue
echo Hello World | supernova :bold.color '#343aeb'
```

### Color Support (Shell)
Five color modes are supported: `true-color` `256` `16` `8` `0`

By default, _supernova_ tries to identify your terminal support and performs the necessary color adaptations with the  `:` operator.

You can use an environment variable (`SUPERNOVA_COLORS`) to force a color mode:

```bash
echo Hello World | SUPERNOVA_COLORS=true-color supernova :color '#D52222'
echo Hello World | SUPERNOVA_COLORS=256 supernova :color '#D52222'
echo Hello World | SUPERNOVA_COLORS=16 supernova :color '#D52222'
echo Hello World | SUPERNOVA_COLORS=8 supernova :color '#D52222'
echo Hello World | SUPERNOVA_COLORS=0 supernova :color '#D52222'
```
