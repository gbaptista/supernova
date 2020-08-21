local lu = require 'luaunit'

local supernova = require 'supernova'

function testSGR()
  supernova:init()

  lu.assertEquals(supernova.red('.enabled', {a=7}), '\27[31m.enabled\27[0m')

  lu.assertEquals(supernova:red(':enabled', {a=7}), '\27[31m:enabled\27[0m')

  lu.assertEquals(supernova.red('.enabled'), '\27[31m.enabled\27[0m')
  lu.assertEquals(supernova:red(':enabled'), '\27[31m:enabled\27[0m')

  lu.assertEquals(
    supernova.apply_command('.enabled', 32, {a=7}),
    '\27[32m.enabled\27[0m'
  )

  lu.assertEquals(
    supernova:apply_command(':enabled', 32, {a=7}),
    '\27[32m:enabled\27[0m'
  )

  lu.assertEquals(
    supernova.apply_command('.enabled', 32),
    '\27[32m.enabled\27[0m'
  )

  lu.assertEquals(
    supernova:apply_command(':enabled', 32),
    '\27[32m:enabled\27[0m'
  )

  lu.assertEquals(
    supernova.color('.enabled [256]', 1),
    '\27[38;5;1m.enabled [256]\27[0m'
  )

  lu.assertEquals(
    supernova.color('.enabled [rgb]', 252, 186, 3),
    '\27[38;2;252;186;3m.enabled [rgb]\27[0m'
  )

  lu.assertEquals(
    supernova.color('.enabled [rgb]', { 252, 186, 3 }),
    '\27[38;2;252;186;3m.enabled [rgb]\27[0m'
  )

  lu.assertEquals(
    supernova.color('.enabled [rgb]', '#00fff2'),
    '\27[38;2;0;255;242m.enabled [rgb]\27[0m'
  )

  lu.assertEquals(
    supernova.color('.enabled [rgb]', '#00FFF2'),
    '\27[38;2;0;255;242m.enabled [rgb]\27[0m'
  )

  lu.assertEquals(
    supernova:color(':enabled [256]', 1),
    '\27[38;5;1m:enabled [256]\27[0m'
  )

  lu.assertEquals(
    supernova:color(':enabled [rgb]', 252, 186, 3),
    '\27[38;2;252;186;3m:enabled [rgb]\27[0m'
  )

  lu.assertEquals(
    supernova:color(':enabled [rgb]', { 252, 186, 3 }),
    '\27[38;2;252;186;3m:enabled [rgb]\27[0m'
  )

  lu.assertEquals(
    supernova:color(':enabled [rgb]', '#00fff2'),
    '\27[38;2;0;255;242m:enabled [rgb]\27[0m'
  )

  lu.assertEquals(
    supernova:color(':enabled [rgb]', '#00FFF2'),
    '\27[38;2;0;255;242m:enabled [rgb]\27[0m'
  )

  supernova:disable()

  lu.assertEquals(supernova.red('.disabled', {a=7}), '\27[31m.disabled\27[0m')
  lu.assertEquals(supernova:red(':disabled', {a=7}), ':disabled')

  lu.assertEquals(supernova.red('.disabled'), '\27[31m.disabled\27[0m')
  lu.assertEquals(supernova:red(':disabled'), ':disabled')

  lu.assertEquals(
    supernova.apply_command('.disabled', 32, {a=7}),
    '\27[32m.disabled\27[0m'
  )

  lu.assertEquals(
    supernova:apply_command(':disabled', 32, {a=7}),
    ':disabled'
  )

  lu.assertEquals(
    supernova.apply_command('.disabled', 32),
    '\27[32m.disabled\27[0m'
  )

  lu.assertEquals(
    supernova:apply_command(':disabled', 32),
    ':disabled'
  )

  lu.assertEquals(
    supernova.color('.disabled [256]', 1),
    '\27[38;5;1m.disabled [256]\27[0m'
  )

  lu.assertEquals(
    supernova.color('.disabled [rgb]', 252, 186, 3),
    '\27[38;2;252;186;3m.disabled [rgb]\27[0m'
  )

  lu.assertEquals(
    supernova.color('.disabled [rgb]', { 252, 186, 3 }),
    '\27[38;2;252;186;3m.disabled [rgb]\27[0m'
  )

  lu.assertEquals(
    supernova.color('.disabled [rgb]', '#00fff2'),
    '\27[38;2;0;255;242m.disabled [rgb]\27[0m'
  )

  lu.assertEquals(
    supernova.color('.disabled [rgb]', '#00FFF2'),
    '\27[38;2;0;255;242m.disabled [rgb]\27[0m'
  )

  lu.assertEquals(
    supernova:color(':disabled [256]', 1),
    ':disabled [256]'
  )

  lu.assertEquals(
    supernova:color(':disabled [rgb]', 252, 186, 3),
    ':disabled [rgb]'
  )

  lu.assertEquals(
    supernova:color(':disabled [rgb]', { 252, 186, 3 }),
    ':disabled [rgb]'
  )

  lu.assertEquals(
    supernova:color(':disabled [rgb]', '#00fff2'),
    ':disabled [rgb]'
  )

  lu.assertEquals(
    supernova:color(':disabled [rgb]', '#00FFF2'),
    ':disabled [rgb]'
  )

  supernova:enable()

  lu.assertEquals(
    supernova:color(':enabled [rgb]', '#00FFF2'),
    '\27[38;2;0;255;242m:enabled [rgb]\27[0m'
  )
end

os.exit(lu.LuaUnit.run())
