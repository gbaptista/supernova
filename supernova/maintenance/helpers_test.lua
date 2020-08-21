local lu = require 'luaunit'

local MaintenanceHelpers = require 'supernova.maintenance.helpers'

function testHelpers()
  local color_names = {
    { key = '3am-in-shibuya' },
    { key = '20000-leagues-under-the-sea' }
  }

  lu.assertEquals(
    MaintenanceHelpers.sort_by(color_names, 'key'),
    {
      { key = '20000-leagues-under-the-sea' },
      { key = '3am-in-shibuya' }
    }
  )

  local unstable_table = { c = 8, b = 7 }

  unstable_table['d'] = 'j'
  unstable_table['a'] = 'y'

  lu.assertEquals(
    MaintenanceHelpers.stable_keys(unstable_table),
    { 'a', 'b', 'c', 'd' }
  )

  local identifier, key = MaintenanceHelpers.to_identifier(' Hóney   Bunny  ')

  lu.assertEquals(identifier, 'honey-bunny')
  lu.assertEquals(key, '_honey_bunny')
end

os.exit(lu.LuaUnit.run())
