local lu = require 'luaunit'

local ColorReductor = require 'supernova.core.color_reductor'

function testReductor()
  lu.assertEquals(ColorReductor.rgb_to_code({ 155, 72, 155 }), 97)

  lu.assertEquals(ColorReductor.rgb_to_code({ 0,   0,   0 }),   1)
  lu.assertEquals(ColorReductor.rgb_to_code({ 170, 0,   0 }),   125)
  lu.assertEquals(ColorReductor.rgb_to_code({ 0,   170, 0 }),   35)
  lu.assertEquals(ColorReductor.rgb_to_code({ 170, 85,  0 }),   131)
  lu.assertEquals(ColorReductor.rgb_to_code({ 0,   0,   170 }), 20)
  lu.assertEquals(ColorReductor.rgb_to_code({ 170, 0,   170 }), 128)
  lu.assertEquals(ColorReductor.rgb_to_code({ 0,   170, 170 }), 38)
  lu.assertEquals(ColorReductor.rgb_to_code({ 170, 170, 170 }), 249)

  lu.assertEquals(ColorReductor.rgb_to_code({ 85,  85,  85 }),  241)
  lu.assertEquals(ColorReductor.rgb_to_code({ 255, 85,  85 }),  204)
  lu.assertEquals(ColorReductor.rgb_to_code({ 85,  255, 85 }),  84)
  lu.assertEquals(ColorReductor.rgb_to_code({ 255, 255, 85 }),  228)
  lu.assertEquals(ColorReductor.rgb_to_code({ 85,  85,  255 }), 64)
  lu.assertEquals(ColorReductor.rgb_to_code({ 255, 85,  255 }), 208)
  lu.assertEquals(ColorReductor.rgb_to_code({ 85,  255, 255 }), 88)
  lu.assertEquals(ColorReductor.rgb_to_code({ 255, 255, 255 }), 16)

  lu.assertEquals(ColorReductor.code_to_sgr_16(38, 17), 30)
  lu.assertEquals(ColorReductor.code_to_sgr_16(38, 125), 31)
  lu.assertEquals(ColorReductor.code_to_sgr_16(38, 35), 32)
  lu.assertEquals(ColorReductor.code_to_sgr_16(38, 131), 33)
  lu.assertEquals(ColorReductor.code_to_sgr_16(38, 20), 34)
  lu.assertEquals(ColorReductor.code_to_sgr_16(38, 128), 35)
  lu.assertEquals(ColorReductor.code_to_sgr_16(38, 38), 36)
  lu.assertEquals(ColorReductor.code_to_sgr_16(38, 249), 37)

  lu.assertEquals(ColorReductor.code_to_sgr_16(38, 241), 90)
  lu.assertEquals(ColorReductor.code_to_sgr_16(38, 204), 30)
  lu.assertEquals(ColorReductor.code_to_sgr_16(38, 84), 92)
  lu.assertEquals(ColorReductor.code_to_sgr_16(38, 228), 93)
  lu.assertEquals(ColorReductor.code_to_sgr_16(38, 64), 94)
  lu.assertEquals(ColorReductor.code_to_sgr_16(38, 208), 95)
  lu.assertEquals(ColorReductor.code_to_sgr_16(38, 88), 96)
  lu.assertEquals(ColorReductor.code_to_sgr_16(38, 16), 97)
end

os.exit(lu.LuaUnit.run())
