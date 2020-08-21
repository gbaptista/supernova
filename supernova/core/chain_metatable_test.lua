local lu = require 'luaunit'

local supernova = require 'supernova'

function testChain()
  supernova:init()

  lu.assertEquals(
    supernova.bold.underline:color(':enabled', 252, 186, 3),
    '\27[38;2;252;186;3m\27[4m\27[1m:enabled\27[0m\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.bg_red.italic:color(':enabled', 252, 186, 3),
    '\27[38;2;252;186;3m\27[3m\27[41m:enabled\27[0m\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.underline.red:bold(':enabled'),
    '\27[1m\27[31m\27[4m:enabled\27[0m\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.bold.underline.color('.enabled', 252, 186, 3),
    '\27[38;2;252;186;3m\27[4m\27[1m.enabled\27[0m\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.bg_red.italic.color('.enabled', 252, 186, 3),
    '\27[38;2;252;186;3m\27[3m\27[41m.enabled\27[0m\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.underline.red.bold('.enabled'),
    '\27[1m\27[31m\27[4m.enabled\27[0m\27[0m\27[0m'
  )

  supernova:disable()

  lu.assertEquals(
    supernova.bold.underline:color(':disabled', 252, 186, 3),
    ':disabled'
  )

  lu.assertEquals(
    supernova.bg_red.italic:color(':disabled', 252, 186, 3),
    ':disabled'
  )

  lu.assertEquals(
    supernova.underline.red:bold(':disabled'),
    ':disabled'
  )

  lu.assertEquals(
    supernova.bold.underline.color('.disabled', 252, 186, 3),
    '\27[38;2;252;186;3m\27[4m\27[1m.disabled\27[0m\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.bg_red.italic.color('.disabled', 252, 186, 3),
    '\27[38;2;252;186;3m\27[3m\27[41m.disabled\27[0m\27[0m\27[0m'
  )

  lu.assertEquals(
    supernova.underline.red.bold('.disabled'),
    '\27[1m\27[31m\27[4m.disabled\27[0m\27[0m\27[0m'
  )
end

os.exit(lu.LuaUnit.run())
