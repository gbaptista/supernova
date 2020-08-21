local lu = require 'luaunit'

local ColorHelper = require 'supernova.helpers.color'

function testColorHelper()
  lu.assertEquals(
    ColorHelper.string_to_rgb(' Honey   Bunny  '),
    { 219, 184, 129 }
  )

  lu.assertEquals(
    ColorHelper.hex_to_rgb('#4287f5'),
    { 66, 135, 245 }
  )

  lu.assertEquals(
    ColorHelper.hex_to_rgb('#d442f5'),
    { 212, 66, 245 }
  )

  lu.assertEquals(
    ColorHelper.rgb_to_hex({ 66, 135, 245 }),
    '#4287F5'
  )

  lu.assertEquals(
    ColorHelper.rgb_to_hex({ 212, 66, 245 }),
    '#D442F5'
  )

  lu.assertEquals(
    ColorHelper.rgbs_to_hex({{ 66, 135, 245 }, { 212, 66, 245 }}),
    { '#4287F5', '#D442F5' }
  )

  lu.assertEquals(
    ColorHelper.nearest({ 66, 135, 245 }),
    {
      colors={
        { identifier = 'sky-dancer', name = 'Sky Dancer', rgb = { 68, 153, 255 } }
      },
      distance=428,
      original={66, 135, 245}
    }
  )

  lu.assertEquals(
    ColorHelper.rgbs_to_hex(
      ColorHelper.naive_gradient(
        ColorHelper.hex_to_rgb('#F54242'),
        ColorHelper.hex_to_rgb('#424EF5'),
        0
      )
    ),
    {}
  )

  lu.assertEquals(
    ColorHelper.rgbs_to_hex(
      ColorHelper.naive_gradient(
        ColorHelper.hex_to_rgb('#F54242'),
        ColorHelper.hex_to_rgb('#424EF5'),
        1
      )
    ),
    { '#F54242' }
  )

  lu.assertEquals(
    ColorHelper.rgbs_to_hex(
      ColorHelper.naive_gradient(
        ColorHelper.hex_to_rgb('#F54242'),
        ColorHelper.hex_to_rgb('#424EF5'),
        3
      )
    ),
    { '#F54242', '#9B489B', '#424EF5' }
  )

  lu.assertEquals(
    ColorHelper.rgbs_to_hex(
      ColorHelper.naive_gradient(
        ColorHelper.hex_to_rgb('#F54242'),
        ColorHelper.hex_to_rgb('#424EF5'),
        100
      )
    ),
    {
      '#F54242', '#F34243', '#F14245', '#EF4247', '#ED4249', '#EB424B', '#EA424C', '#E8424E',
      '#E64250', '#E44352', '#E24354', '#E14355', '#DF4357', '#DD4359', '#DB435B', '#D9435D',
      '#D8435E', '#D64460', '#D44462', '#D24464', '#D04466', '#CF4467', '#CD4469', '#CB446B',
      '#C9446D', '#C7456F', '#C54571', '#C44572', '#C24574', '#C04576', '#BE4578', '#BC457A',
      '#BB457B', '#B9467D', '#B7467F', '#B54681', '#B34683', '#B24684', '#B04686', '#AE4688',
      '#AC468A', '#AA468C', '#A9478D', '#A7478F', '#A54791', '#A34793', '#A14795', '#A04796',
      '#9E4798', '#9C479A', '#9A489C', '#98489E', '#9648A0', '#9548A1', '#9348A3', '#9148A5',
      '#8F48A7', '#8D48A9', '#8C49AA', '#8A49AC', '#8849AE', '#8649B0', '#8449B2', '#8349B3',
      '#8149B5', '#7F49B7', '#7D4AB9', '#7B4ABB', '#7A4ABC', '#784ABE', '#764AC0', '#744AC2',
      '#724AC4', '#714AC5', '#6F4AC7', '#6D4BC9', '#6B4BCB', '#694BCD', '#674BCF', '#664BD0',
      '#644BD2', '#624BD4', '#604BD6', '#5E4CD8', '#5D4CD9', '#5B4CDB', '#594CDD', '#574CDF',
      '#554CE1', '#544CE2', '#524CE4', '#504DE6', '#4E4DE8', '#4C4DEA', '#4B4DEB', '#494DED',
      '#474DEF', '#454DF1', '#434DF3', '#424DF4', '#424EF5'
    }
  )
end

os.exit(lu.LuaUnit.run())
