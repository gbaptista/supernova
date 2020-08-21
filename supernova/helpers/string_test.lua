local lu = require 'luaunit'

local StringHelper = require 'supernova.helpers.string'

function testHelpers()
  lu.assertEquals(
    StringHelper.remove_accents('Lórem'),
    'Lorem'
  )

  lu.assertEquals(
    StringHelper.strip('\n\n   Lórem  \n\r  \r\n'),
    'Lórem'
  )

  local identifier, key = StringHelper.to_identifier(' Honey   Bunny  ')

  lu.assertEquals(identifier, 'honey-bunny')
  lu.assertEquals(key, '_honey_bunny')
end

os.exit(lu.LuaUnit.run())
