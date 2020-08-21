local lu = require 'luaunit'

local supernova = require 'supernova'

function testRegisterColors()
  local theme = {
    identifier = 'rainbow',
    author = 'billy_apple',
    colors = { '#F3A002', '#59D044', '#F24D98', '#F2F44D', '#813B7C' }
  }

  local result = supernova:register(theme)

  lu.assertEquals(
    result,
    {
      identifier='rainbow',
      styles = { 'jack-o', 'koopa-green-shell', 'majestic-magenta', 'pilsener', 'violet-vixen' }
    }
  )

  lu.assertEquals(
    supernova.rainbow.rainbow('.enabled'),
    '\27[38;2;243;160;2m.\27[0m\27[38;2;89;208;68me\27[0m\27[38;2;89;208;68mn\27[0m\27[38;2;242;77;152ma\27[0m\27[38;2;242;77;152mb\27[0m\27[38;2;242;244;77ml\27[0m\27[38;2;242;244;77me\27[0m\27[38;2;129;59;124md\27[0m'
  )

  lu.assertEquals(
    supernova.rainbow.jack_o('.enabled'),
    '\27[38;2;243;160;2m.enabled\27[0m'
  )

  supernova:set_theme('rainbow')

  lu.assertEquals(
    supernova['jack-o']('.enabled'),
    '\27[38;2;243;160;2m.enabled\27[0m'
  )
end

function testRegisterColorNames()
  local theme = {
    identifier = 'rainbow',
    author = 'billy_apple',
    colors = {
      jack_o = '#F3A002',
      koopa_green_shell = '#59D044',
      majestic_magenta = '#F24D98',
      pilsener = '#F2F44D',
      violet_vixen = '#813B7C'
    }
  }

  local result = supernova:register(theme)

  lu.assertEquals(
    result,
    {
      identifier = 'rainbow',
      styles = { 'jack_o', 'koopa_green_shell', 'majestic_magenta', 'pilsener', 'violet_vixen' }

    }
  )

  lu.assertEquals(
    supernova.rainbow.jack_o('.enabled'),
    '\27[38;2;243;160;2m.enabled\27[0m'
  )

  supernova:set_theme('rainbow')

  lu.assertEquals(
    supernova['jack-o']('.enabled'),
    '\27[38;2;243;160;2m.enabled\27[0m'
  )
end

os.exit(lu.LuaUnit.run())
