local lu = require 'luaunit'

local supernova = require 'supernova'

function testChain()
  supernova:init()

  supernova:register('warning').italic.color('#ffa200')

  supernova:register('super_warning').warning.bold.underline()

  lu.assertEquals(
    supernova.super_warning('super_warning'),
    '\27[4m\27[1m\27[38;2;255;162;0msuper_warning\27[0m\27[0m\27[0m'
  )
end

function testThemeStylesNamespace()
  supernova:init()

  supernova:register('warning', 'my-custom').underline.yellow()
  supernova:register('canceled', 'my-custom').strike.color()
  supernova:register('cooler', 'my_custom').bold.color(0, 123, 255)

  lu.assertErrorMsgContains(
    'unknown style: cooler',
    supernova.cooler, '.enabled'
  )

  lu.assertEquals(
    supernova.default.red('.enabled'),
    '\27[31m.enabled\27[0m'
  )

  lu.assertEquals(
    supernova.my_custom.cooler('.enabled'),
    '\27[38;2;0;123;255m\27[1m.enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.my_custom.cooler('.enabled'),
    '\27[38;2;0;123;255m\27[1m.enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.my_custom.cooler('.enabled', '#fc2803'),
    '\27[38;2;252;40;3m\27[1m.enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.my_custom.underline.cooler.italic('.enabled'),
    '\27[3m\27[38;2;0;123;255m\27[1m\27[4m.enabled\27[0m\27[0m\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.my_custom:cooler(':enabled'),
    '\27[38;2;0;123;255m\27[1m:enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.my_custom:cooler(':enabled', '#fc2803'),
    '\27[38;2;252;40;3m\27[1m:enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.my_custom.underline.cooler:italic(':enabled'),
    '\27[3m\27[38;2;0;123;255m\27[1m\27[4m:enabled\27[0m\27[0m\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.my_custom.canceled('.enabled', '#fc2803'),
    '\27[38;2;252;40;3m\27[9m.enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.my_custom:canceled(':enabled', '#fc2803'),
    '\27[38;2;252;40;3m\27[9m:enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.my_custom.warning('.enabled'),
    '\27[33m\27[4m.enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.my_custom:warning(':enabled'),
    '\27[33m\27[4m:enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.my_custom.bg_red.warning.italic('.enabled'),
    '\27[3m\27[33m\27[4m\27[41m.enabled\27[0m\27[0m\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.my_custom.bg_red.warning:italic(':enabled'),
    '\27[3m\27[33m\27[4m\27[41m:enabled\27[0m\27[0m\27[0m\27[0m'
  )

  supernova:disable()

  lu.assertEquals(
    supernova['my-custom'].canceled('.disabled', '#fc2803'),
    '\27[38;2;252;40;3m\27[9m.disabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova['my-custom']:canceled(':disabled', '#fc2803'),
    ':disabled'
  )

  lu.assertEquals(
    supernova['my-custom'].warning('.disabled'),
    '\27[33m\27[4m.disabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova['my-custom']:warning(':disabled'),
    ':disabled'
  )

  lu.assertEquals(
    supernova['my-custom'].bg_red.warning.italic('.disabled'),
    '\27[3m\27[33m\27[4m\27[41m.disabled\27[0m\27[0m\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova['my-custom'].bg_red.warning:italic(':disabled'),
    ':disabled'
  )

  lu.assertEquals(
    supernova['my-custom'].cooler('.disabled'),
    '\27[38;2;0;123;255m\27[1m.disabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova['my-custom'].underline.cooler.italic('.disabled'),
    '\27[3m\27[38;2;0;123;255m\27[1m\27[4m.disabled\27[0m\27[0m\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova['my-custom'].cooler('.disabled', '#fc2803'),
    '\27[38;2;252;40;3m\27[1m.disabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova['my-custom']:cooler(':disabled'),
    ':disabled'
  )

  lu.assertEquals(
    supernova['my-custom']:cooler(':disabled', '#fc2803'),
    ':disabled'
  )

  lu.assertEquals(
    supernova['my-custom'].underline.cooler:italic(':disabled'),
    ':disabled'
  )
end

function testThemeStyles()
  supernova:init()

  supernova:enable()

  supernova:register('warning', 'custom_theme').underline.yellow()
  supernova:register('canceled', 'custom_theme').strike.color()
  supernova:register('cooler', 'custom_theme').bold.color(0, 123, 255)

  lu.assertErrorMsgContains(
    'unknown style: cooler',
    supernova.cooler, '.enabled'
  )

  supernova:set_theme('custom_theme')

  lu.assertEquals(
    supernova.cooler('.enabled'),
    '\27[38;2;0;123;255m\27[1m.enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.cooler('.enabled'),
    '\27[38;2;0;123;255m\27[1m.enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.cooler('.enabled', '#fc2803'),
    '\27[38;2;252;40;3m\27[1m.enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.underline.cooler.italic('.enabled'),
    '\27[3m\27[38;2;0;123;255m\27[1m\27[4m.enabled\27[0m\27[0m\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova:cooler(':enabled'),
    '\27[38;2;0;123;255m\27[1m:enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova:cooler(':enabled', '#fc2803'),
    '\27[38;2;252;40;3m\27[1m:enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.underline.cooler:italic(':enabled'),
    '\27[3m\27[38;2;0;123;255m\27[1m\27[4m:enabled\27[0m\27[0m\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.canceled('.enabled', '#fc2803'),
    '\27[38;2;252;40;3m\27[9m.enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova:canceled(':enabled', '#fc2803'),
    '\27[38;2;252;40;3m\27[9m:enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.warning('.enabled'),
    '\27[33m\27[4m.enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova:warning(':enabled'),
    '\27[33m\27[4m:enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.bg_red.warning.italic('.enabled'),
    '\27[3m\27[33m\27[4m\27[41m.enabled\27[0m\27[0m\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.bg_red.warning:italic(':enabled'),
    '\27[3m\27[33m\27[4m\27[41m:enabled\27[0m\27[0m\27[0m\27[0m'
  )

  supernova:disable()

  lu.assertEquals(
    supernova.canceled('.disabled', '#fc2803'),
    '\27[38;2;252;40;3m\27[9m.disabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova:canceled(':disabled', '#fc2803'),
    ':disabled'
  )

  lu.assertEquals(
    supernova.warning('.disabled'),
    '\27[33m\27[4m.disabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova:warning(':disabled'),
    ':disabled'
  )

  lu.assertEquals(
    supernova.bg_red.warning.italic('.disabled'),
    '\27[3m\27[33m\27[4m\27[41m.disabled\27[0m\27[0m\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.bg_red.warning:italic(':disabled'),
    ':disabled'
  )

  lu.assertEquals(
    supernova.cooler('.disabled'),
    '\27[38;2;0;123;255m\27[1m.disabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.underline.cooler.italic('.disabled'),
    '\27[3m\27[38;2;0;123;255m\27[1m\27[4m.disabled\27[0m\27[0m\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.cooler('.disabled', '#fc2803'),
    '\27[38;2;252;40;3m\27[1m.disabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova:cooler(':disabled'),
    ':disabled'
  )

  lu.assertEquals(
    supernova:cooler(':disabled', '#fc2803'),
    ':disabled'
  )

  lu.assertEquals(
    supernova.underline.cooler:italic(':disabled'),
    ':disabled'
  )
end

function testStyles()
  supernova:init()

  supernova:register('warning').underline.yellow()
  supernova:register('canceled').strike.color()
  supernova:register('cooler').bold.color(0, 123, 255)

  lu.assertEquals(
    supernova.cooler('.enabled'),
    '\27[38;2;0;123;255m\27[1m.enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.cooler('.enabled', '#fc2803'),
    '\27[38;2;252;40;3m\27[1m.enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.underline.cooler.italic('.enabled'),
    '\27[3m\27[38;2;0;123;255m\27[1m\27[4m.enabled\27[0m\27[0m\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova:cooler(':enabled'),
    '\27[38;2;0;123;255m\27[1m:enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova:cooler(':enabled', '#fc2803'),
    '\27[38;2;252;40;3m\27[1m:enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.underline.cooler:italic(':enabled'),
    '\27[3m\27[38;2;0;123;255m\27[1m\27[4m:enabled\27[0m\27[0m\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.canceled('.enabled', '#fc2803'),
    '\27[38;2;252;40;3m\27[9m.enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova:canceled(':enabled', '#fc2803'),
    '\27[38;2;252;40;3m\27[9m:enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.warning('.enabled'),
    '\27[33m\27[4m.enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova:warning(':enabled'),
    '\27[33m\27[4m:enabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.bg_red.warning.italic('.enabled'),
    '\27[3m\27[33m\27[4m\27[41m.enabled\27[0m\27[0m\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.bg_red.warning:italic(':enabled'),
    '\27[3m\27[33m\27[4m\27[41m:enabled\27[0m\27[0m\27[0m\27[0m'
  )

  supernova:disable()

  lu.assertEquals(
    supernova.canceled('.disabled', '#fc2803'),
    '\27[38;2;252;40;3m\27[9m.disabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova:canceled(':disabled', '#fc2803'),
    ':disabled'
  )

  lu.assertEquals(
    supernova.warning('.disabled'),
    '\27[33m\27[4m.disabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova:warning(':disabled'),
    ':disabled'
  )

  lu.assertEquals(
    supernova.bg_red.warning.italic('.disabled'),
    '\27[3m\27[33m\27[4m\27[41m.disabled\27[0m\27[0m\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.bg_red.warning:italic(':disabled'),
    ':disabled'
  )

  lu.assertEquals(
    supernova.cooler('.disabled'),
    '\27[38;2;0;123;255m\27[1m.disabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.underline.cooler.italic('.disabled'),
    '\27[3m\27[38;2;0;123;255m\27[1m\27[4m.disabled\27[0m\27[0m\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.cooler('.disabled', '#fc2803'),
    '\27[38;2;252;40;3m\27[1m.disabled\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova:cooler(':disabled'),
    ':disabled'
  )

  lu.assertEquals(
    supernova:cooler(':disabled', '#fc2803'),
    ':disabled'
  )

  lu.assertEquals(
    supernova.underline.cooler:italic(':disabled'),
    ':disabled'
  )
end


os.exit(lu.LuaUnit.run())
