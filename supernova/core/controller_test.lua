local lu = require 'luaunit'

local supernova = require 'supernova'

function testController()
  supernova:init()

  lu.assertEquals(supernova.red('.enabled'), '\27[31m.enabled\27[0m')
  lu.assertEquals(supernova:red(':enabled'), '\27[31m:enabled\27[0m')

  supernova:disable()

  lu.assertEquals(supernova.red('.disabled'), '\27[31m.disabled\27[0m')
  lu.assertEquals(supernova:red(':disabled'), ':disabled')
end

os.exit(lu.LuaUnit.run())
