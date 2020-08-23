local lu = require 'luaunit'

local TableHelper = require 'supernova.helpers.table'

function testHelpers()
  local packed = TableHelper.pack(1, nil, 'a')

  lu.assertEquals(packed[1], 1)
  lu.assertEquals(packed[2], nil)
  lu.assertEquals(packed[3], 'a')

  local unpacked_a, unpacked_b, unpacked_c = TableHelper.unpack({1, nil, 'a'})

  lu.assertEquals(unpacked_a, 1)
  lu.assertEquals(unpacked_b, nil)
  lu.assertEquals(unpacked_c, 'a')
end

os.exit(lu.LuaUnit.run())
