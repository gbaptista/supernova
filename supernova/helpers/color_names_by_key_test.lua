local lu = require 'luaunit'

local COLOR_NAMES_BY_KEY = require 'supernova.helpers.color_names_by_key'

function testColorNames()
  lu.assertEquals(
    COLOR_NAMES_BY_KEY['_3am_in_shibuya'],
    {
      identifier = '3am-in-shibuya',
      name = '3AM in Shibuya',
      rgb = { 34, 85, 119 }
    }
  )
end

os.exit(lu.LuaUnit.run())
