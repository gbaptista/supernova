local lu = require 'luaunit'

local supernova = require 'supernova'

function testSupernova()
  supernova:init()

  lu.assertEquals(supernova.red('red text'), '\27[31mred text\27[0m')

  lu.assertEquals(
    supernova.hex_to_rgb('#FFFFFF'),
    { 255, 255, 255 }
  )

  lu.assertEquals(
    supernova.helpers.hex_to_rgb('#FFFFFF'),
    { 255, 255, 255 }
  )

  lu.assertEquals(
    supernova.helpers.nearest_color('#ad03fc'),
    {
      color = {
        identifier  = 'spectacular-purple',
        name = 'Spectacular Purple',
        hex  = '#BB00FF',
        rgb  = { 187, 0, 255 }
      },
      distance=214
    }
  )

  lu.assertEquals(
    supernova.helpers.nearest_colors('#ad03fc'),
    {
      colors = {
        {
          identifier  = 'spectacular-purple',
          name = 'Spectacular Purple',
          hex  = '#BB00FF',
          rgb  = { 187, 0, 255 }
        },
        {
          identifier  = 'vivid-violet',
          name = 'Vivid Violet',
          hex  = '#9F00FF',
          rgb  = { 159, 0, 255 }
        }
      },
      distance=214
    }
  )
end

os.exit(lu.LuaUnit.run())
