local lu = require 'luaunit'

local ANSI = require 'supernova.core.ansi'

function testANSI()
  lu.assertEquals(ANSI.wrap('lorem'), '\27[lorem\27[0m')

  lu.assertEquals(ANSI.SGR_CODES.color, 38)
  lu.assertEquals(ANSI.SGR_CODES.background, 48)
  lu.assertEquals(ANSI.SGR_CODES.underline_color, 58)
end

os.exit(lu.LuaUnit.run())
