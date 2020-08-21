local lu = require 'luaunit'

local COLOR_NAMES = require 'supernova.helpers.color_names'

function testColorNames()
  lu.assertEquals(
    COLOR_NAMES[1],
    {
      identifier  = '20000-leagues-under-the-sea',
      name = '20000 Leagues Under the Sea',
      rgb  = { 25, 25, 112 }
    }
  )
end

os.exit(lu.LuaUnit.run())
