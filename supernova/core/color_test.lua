local lu = require 'luaunit'

local supernova = require 'supernova'

function testOldLua()
  lu.assertEquals(
    supernova.gradient(
      'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.\nNunc tristique blandit leo.',
      { '#ff0000', '#00ff00', '#0000ff', '#fbff00' }
    ),
    '\27[38;2;255;0;0mL\27[0m\27[38;2;226;28;0mo\27[0m\27[38;2;198;56;0mr\27[0m\27[38;2;170;85;0me\27[0m\27[38;2;141;113;0mm\27[0m\27[38;2;113;141;0m \27[0m\27[38;2;84;170;0mi\27[0m\27[38;2;56;198;0mp\27[0m\27[38;2;28;226;0ms\27[0m\27[38;2;0;255;0mu\27[0m\27[38;2;0;255;0mm\27[0m\27[38;2;0;226;28m \27[0m\27[38;2;0;198;56md\27[0m\27[38;2;0;170;85mo\27[0m\27[38;2;0;141;113ml\27[0m\27[38;2;0;113;141mo\27[0m\27[38;2;0;84;170mr\27[0m\27[38;2;0;56;198m \27[0m\27[38;2;0;28;226ms\27[0m\27[38;2;0;0;255mi\27[0m\27[38;2;0;0;255mt\27[0m\27[38;2;27;28;226m \27[0m\27[38;2;55;56;198ma\27[0m\27[38;2;83;85;170mm\27[0m\27[38;2;111;113;141me\27[0m\27[38;2;139;141;113mt\27[0m\27[38;2;167;170;84m,\27[0m\n\27[38;2;255;0;0mc\27[0m\27[38;2;226;28;0mo\27[0m\27[38;2;198;56;0mn\27[0m\27[38;2;170;85;0ms\27[0m\27[38;2;141;113;0me\27[0m\27[38;2;113;141;0mc\27[0m\27[38;2;84;170;0mt\27[0m\27[38;2;56;198;0me\27[0m\27[38;2;28;226;0mt\27[0m\27[38;2;0;255;0mu\27[0m\27[38;2;0;255;0mr\27[0m\27[38;2;0;226;28m \27[0m\27[38;2;0;198;56ma\27[0m\27[38;2;0;170;85md\27[0m\27[38;2;0;141;113mi\27[0m\27[38;2;0;113;141mp\27[0m\27[38;2;0;84;170mi\27[0m\27[38;2;0;56;198ms\27[0m\27[38;2;0;28;226mc\27[0m\27[38;2;0;0;255mi\27[0m\27[38;2;0;0;255mn\27[0m\27[38;2;27;28;226mg\27[0m\27[38;2;55;56;198m \27[0m\27[38;2;83;85;170me\27[0m\27[38;2;111;113;141ml\27[0m\27[38;2;139;141;113mi\27[0m\27[38;2;167;170;84mt\27[0m\27[38;2;195;198;56m.\27[0m\n\27[38;2;255;0;0mN\27[0m\27[38;2;226;28;0mu\27[0m\27[38;2;198;56;0mn\27[0m\27[38;2;170;85;0mc\27[0m\27[38;2;141;113;0m \27[0m\27[38;2;113;141;0mt\27[0m\27[38;2;84;170;0mr\27[0m\27[38;2;56;198;0mi\27[0m\27[38;2;28;226;0ms\27[0m\27[38;2;0;255;0mt\27[0m\27[38;2;0;255;0mi\27[0m\27[38;2;0;226;28mq\27[0m\27[38;2;0;198;56mu\27[0m\27[38;2;0;170;85me\27[0m\27[38;2;0;141;113m \27[0m\27[38;2;0;113;141mb\27[0m\27[38;2;0;84;170ml\27[0m\27[38;2;0;56;198ma\27[0m\27[38;2;0;28;226mn\27[0m\27[38;2;0;0;255md\27[0m\27[38;2;0;0;255mi\27[0m\27[38;2;27;28;226mt\27[0m\27[38;2;55;56;198m \27[0m\27[38;2;83;85;170ml\27[0m\27[38;2;111;113;141me\27[0m\27[38;2;139;141;113mo\27[0m\27[38;2;167;170;84m.\27[0m'
  )

  lu.assertEquals(
    supernova.gradient('.zero colors', { '#eb3434', '#343aeb'}),
    '\27[38;2;235;52;52m.\27[0m\27[38;2;218;52;68mz\27[0m\27[38;2;201;53;85me\27[0m\27[38;2;185;53;101mr\27[0m\27[38;2;168;54;118mo\27[0m\27[38;2;151;54;135m \27[0m\27[38;2;135;55;151mc\27[0m\27[38;2;118;55;168mo\27[0m\27[38;2;101;56;185ml\27[0m\27[38;2;85;56;201mo\27[0m\27[38;2;68;57;218mr\27[0m\27[38;2;52;58;235ms\27[0m'
  )

  lu.assertEquals(
    supernova.gradient('.zero colors\n', { '#eb3434', '#343aeb'}),
    '\27[38;2;235;52;52m.\27[0m\27[38;2;218;52;68mz\27[0m\27[38;2;201;53;85me\27[0m\27[38;2;185;53;101mr\27[0m\27[38;2;168;54;118mo\27[0m\27[38;2;151;54;135m \27[0m\27[38;2;135;55;151mc\27[0m\27[38;2;118;55;168mo\27[0m\27[38;2;101;56;185ml\27[0m\27[38;2;85;56;201mo\27[0m\27[38;2;68;57;218mr\27[0m\27[38;2;52;58;235ms\27[0m\n'
  )

  lu.assertEquals(
    supernova.gradient('.zero colors\n\n', { '#eb3434', '#343aeb'}),
    '\27[38;2;235;52;52m.\27[0m\27[38;2;218;52;68mz\27[0m\27[38;2;201;53;85me\27[0m\27[38;2;185;53;101mr\27[0m\27[38;2;168;54;118mo\27[0m\27[38;2;151;54;135m \27[0m\27[38;2;135;55;151mc\27[0m\27[38;2;118;55;168mo\27[0m\27[38;2;101;56;185ml\27[0m\27[38;2;85;56;201mo\27[0m\27[38;2;68;57;218mr\27[0m\27[38;2;52;58;235ms\27[0m\n\n'
  )

  lu.assertEquals(
    supernova.gradient('.zero colors\n\n\n', { '#eb3434', '#343aeb'}),
    '\27[38;2;235;52;52m.\27[0m\27[38;2;218;52;68mz\27[0m\27[38;2;201;53;85me\27[0m\27[38;2;185;53;101mr\27[0m\27[38;2;168;54;118mo\27[0m\27[38;2;151;54;135m \27[0m\27[38;2;135;55;151mc\27[0m\27[38;2;118;55;168mo\27[0m\27[38;2;101;56;185ml\27[0m\27[38;2;85;56;201mo\27[0m\27[38;2;68;57;218mr\27[0m\27[38;2;52;58;235ms\27[0m\n\n\n'
  )
end

function testBackgroundReset()
  lu.assertEquals(
    supernova.color('.zero colors', '#9b489b'),
    '\27[38;2;155;72;155m.zero colors\27[0m'
  )
end

function test16Colors()
  supernova:init()

  lu.assertEquals(
    supernova.color('.zero colors', '#9b489b'),
    '\27[38;2;155;72;155m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:color(':zero colors', '#9b489b'),
    '\27[38;2;155;72;155m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.color('.zero colors', 128),
    '\27[38;5;128m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:color(':zero colors', 128),
    '\27[38;5;128m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.color('.zero colors', 'Wavelet'),
    '\27[38;2;125;196;205m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:color(':zero colors', 'Wavelet'),
     '\27[38;2;125;196;205m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.red('.zero colors'),
    '\27[31m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:red(':zero colors'),
    '\27[31m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.bright_red('.zero colors'),
    '\27[91m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:bright_red(':zero colors'),
    '\27[91m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.bg_red('.zero colors'),
    '\27[41m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:bg_red(':zero colors'),
    '\27[41m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.bg_bright_red('.zero colors'),
    '\27[101m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:bg_bright_red(':zero colors'),
    '\27[101m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.gradient('.zero colors', { '#eb3434', '#343aeb'}),
    '\27[38;2;235;52;52m.\27[0m\27[38;2;218;52;68mz\27[0m\27[38;2;201;53;85me\27[0m\27[38;2;185;53;101mr\27[0m\27[38;2;168;54;118mo\27[0m\27[38;2;151;54;135m \27[0m\27[38;2;135;55;151mc\27[0m\27[38;2;118;55;168mo\27[0m\27[38;2;101;56;185ml\27[0m\27[38;2;85;56;201mo\27[0m\27[38;2;68;57;218mr\27[0m\27[38;2;52;58;235ms\27[0m'
  )

  lu.assertEquals(
    supernova:gradient(':zero colors', { '#eb3434', '#343aeb'}),
    '\27[38;2;235;52;52m:\27[0m\27[38;2;218;52;68mz\27[0m\27[38;2;201;53;85me\27[0m\27[38;2;185;53;101mr\27[0m\27[38;2;168;54;118mo\27[0m\27[38;2;151;54;135m \27[0m\27[38;2;135;55;151mc\27[0m\27[38;2;118;55;168mo\27[0m\27[38;2;101;56;185ml\27[0m\27[38;2;85;56;201mo\27[0m\27[38;2;68;57;218mr\27[0m\27[38;2;52;58;235ms\27[0m'
  )

  supernova:set_colors(16)

  lu.assertEquals(
    supernova.color('.zero colors', '#9b489b'),
    '\27[38;2;155;72;155m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:color(':zero colors', '#9b489b'),
    '\27[90m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.color('.zero colors', 128),
    '\27[38;5;128m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:color(':zero colors', 128),
    '\27[35m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.color('.zero colors', 'Wavelet'),
    '\27[38;2;125;196;205m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:color(':zero colors', 'Wavelet'),
     '\27[37m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.red('.zero colors'),
    '\27[31m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:red(':zero colors'),
    '\27[31m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.bright_red('.zero colors'),
    '\27[91m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:bright_red(':zero colors'),
    '\27[91m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.bg_red('.zero colors'),
    '\27[41m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:bg_red(':zero colors'),
    '\27[41m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.bg_bright_red('.zero colors'),
    '\27[101m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:bg_bright_red(':zero colors'),
    '\27[101m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.gradient('.zero colors', { '#eb3434', '#343aeb'}),
    '\27[38;2;235;52;52m.\27[0m\27[38;2;218;52;68mz\27[0m\27[38;2;201;53;85me\27[0m\27[38;2;185;53;101mr\27[0m\27[38;2;168;54;118mo\27[0m\27[38;2;151;54;135m \27[0m\27[38;2;135;55;151mc\27[0m\27[38;2;118;55;168mo\27[0m\27[38;2;101;56;185ml\27[0m\27[38;2;85;56;201mo\27[0m\27[38;2;68;57;218mr\27[0m\27[38;2;52;58;235ms\27[0m'
  )

  lu.assertEquals(
    supernova:gradient(':zero colors', { '#eb3434', '#343aeb'}),
    '\27[30m:\27[0m\27[30mz\27[0m\27[30me\27[0m\27[30mr\27[0m\27[37mo\27[0m\27[90m \27[0m\27[90mc\27[0m\27[37mo\27[0m\27[94ml\27[0m\27[94mo\27[0m\27[94mr\27[0m\27[94ms\27[0m'
  )
end

function test256Colors()
  supernova:init()

  lu.assertEquals(
    supernova.color('.zero colors', '#9b489b'),
    '\27[38;2;155;72;155m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:color(':zero colors', '#9b489b'),
    '\27[38;2;155;72;155m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.color('.zero colors', 128),
    '\27[38;5;128m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:color(':zero colors', 128),
    '\27[38;5;128m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.color('.zero colors', 'Wavelet'),
    '\27[38;2;125;196;205m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:color(':zero colors', 'Wavelet'),
     '\27[38;2;125;196;205m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.red('.zero colors'),
    '\27[31m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:red(':zero colors'),
    '\27[31m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.bright_red('.zero colors'),
    '\27[91m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:bright_red(':zero colors'),
    '\27[91m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.bg_red('.zero colors'),
    '\27[41m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:bg_red(':zero colors'),
    '\27[41m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.bg_bright_red('.zero colors'),
    '\27[101m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:bg_bright_red(':zero colors'),
    '\27[101m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.gradient('.zero colors', { '#eb3434', '#343aeb'}),
    '\27[38;2;235;52;52m.\27[0m\27[38;2;218;52;68mz\27[0m\27[38;2;201;53;85me\27[0m\27[38;2;185;53;101mr\27[0m\27[38;2;168;54;118mo\27[0m\27[38;2;151;54;135m \27[0m\27[38;2;135;55;151mc\27[0m\27[38;2;118;55;168mo\27[0m\27[38;2;101;56;185ml\27[0m\27[38;2;85;56;201mo\27[0m\27[38;2;68;57;218mr\27[0m\27[38;2;52;58;235ms\27[0m'
  )

  lu.assertEquals(
    supernova:gradient(':zero colors', { '#eb3434', '#343aeb'}),
    '\27[38;2;235;52;52m:\27[0m\27[38;2;218;52;68mz\27[0m\27[38;2;201;53;85me\27[0m\27[38;2;185;53;101mr\27[0m\27[38;2;168;54;118mo\27[0m\27[38;2;151;54;135m \27[0m\27[38;2;135;55;151mc\27[0m\27[38;2;118;55;168mo\27[0m\27[38;2;101;56;185ml\27[0m\27[38;2;85;56;201mo\27[0m\27[38;2;68;57;218mr\27[0m\27[38;2;52;58;235ms\27[0m'
  )

  supernova:set_colors(256)

  lu.assertEquals(
    supernova.color('.zero colors', '#9b489b'),
    '\27[38;2;155;72;155m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:color(':zero colors', '#9b489b'),
    '\27[38;5;97m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.color('.zero colors', 128),
    '\27[38;5;128m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:color(':zero colors', 128),
    '\27[38;5;128m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.color('.zero colors', 'Wavelet'),
    '\27[38;2;125;196;205m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:color(':zero colors', 'Wavelet'),
     '\27[38;5;117m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.red('.zero colors'),
    '\27[31m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:red(':zero colors'),
    '\27[31m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.bright_red('.zero colors'),
    '\27[91m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:bright_red(':zero colors'),
    '\27[91m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.bg_red('.zero colors'),
    '\27[41m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:bg_red(':zero colors'),
    '\27[41m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.bg_bright_red('.zero colors'),
    '\27[101m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:bg_bright_red(':zero colors'),
    '\27[101m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.gradient('.zero colors', { '#eb3434', '#343aeb'}),
    '\27[38;2;235;52;52m.\27[0m\27[38;2;218;52;68mz\27[0m\27[38;2;201;53;85me\27[0m\27[38;2;185;53;101mr\27[0m\27[38;2;168;54;118mo\27[0m\27[38;2;151;54;135m \27[0m\27[38;2;135;55;151mc\27[0m\27[38;2;118;55;168mo\27[0m\27[38;2;101;56;185ml\27[0m\27[38;2;85;56;201mo\27[0m\27[38;2;68;57;218mr\27[0m\27[38;2;52;58;235ms\27[0m'
  )

  lu.assertEquals(
    supernova:gradient(':zero colors', { '#eb3434', '#343aeb'}),
    '\27[38;5;168m:\27[0m\27[38;5;168mz\27[0m\27[38;5;168me\27[0m\27[38;5;132mr\27[0m\27[38;5;133mo\27[0m\27[38;5;97m \27[0m\27[38;5;97mc\27[0m\27[38;5;98mo\27[0m\27[38;5;62ml\27[0m\27[38;5;63mo\27[0m\27[38;5;63mr\27[0m\27[38;5;63ms\27[0m'
  )
end

function testZeroColors()
  supernova:init()

  lu.assertEquals(
    supernova.color('.zero colors', '#9b489b'),
    '\27[38;2;155;72;155m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:color(':zero colors', '#9b489b'),
    '\27[38;2;155;72;155m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.color('.zero colors', 128),
    '\27[38;5;128m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:color(':zero colors', 128),
    '\27[38;5;128m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.color('.zero colors', 'Wavelet'),
    '\27[38;2;125;196;205m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:color(':zero colors', 'Wavelet'),
     '\27[38;2;125;196;205m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.red('.zero colors'),
    '\27[31m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:red(':zero colors'),
    '\27[31m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.bright_red('.zero colors'),
    '\27[91m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:bright_red(':zero colors'),
    '\27[91m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.bg_red('.zero colors'),
    '\27[41m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:bg_red(':zero colors'),
    '\27[41m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.bg_bright_red('.zero colors'),
    '\27[101m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:bg_bright_red(':zero colors'),
    '\27[101m:zero colors\27[0m'
  )

  lu.assertEquals(
    supernova.gradient('.zero colors', { '#eb3434', '#343aeb'}),
    '\27[38;2;235;52;52m.\27[0m\27[38;2;218;52;68mz\27[0m\27[38;2;201;53;85me\27[0m\27[38;2;185;53;101mr\27[0m\27[38;2;168;54;118mo\27[0m\27[38;2;151;54;135m \27[0m\27[38;2;135;55;151mc\27[0m\27[38;2;118;55;168mo\27[0m\27[38;2;101;56;185ml\27[0m\27[38;2;85;56;201mo\27[0m\27[38;2;68;57;218mr\27[0m\27[38;2;52;58;235ms\27[0m'
  )

  lu.assertEquals(
    supernova:gradient(':zero colors', { '#eb3434', '#343aeb'}),
    '\27[38;2;235;52;52m:\27[0m\27[38;2;218;52;68mz\27[0m\27[38;2;201;53;85me\27[0m\27[38;2;185;53;101mr\27[0m\27[38;2;168;54;118mo\27[0m\27[38;2;151;54;135m \27[0m\27[38;2;135;55;151mc\27[0m\27[38;2;118;55;168mo\27[0m\27[38;2;101;56;185ml\27[0m\27[38;2;85;56;201mo\27[0m\27[38;2;68;57;218mr\27[0m\27[38;2;52;58;235ms\27[0m'
  )

  supernova:set_colors(0)

  lu.assertEquals(
    supernova.color('.zero colors', '#9b489b'),
    '\27[38;2;155;72;155m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:color(':zero colors', '#9b489b'),
    ':zero colors'
  )

  lu.assertEquals(
    supernova.color('.zero colors', 128),
    '\27[38;5;128m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:color(':zero colors', 128),
    ':zero colors'
  )

  lu.assertEquals(
    supernova.color('.zero colors', 'Wavelet'),
    '\27[38;2;125;196;205m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:color(':zero colors', 'Wavelet'),
     ':zero colors'
  )

  lu.assertEquals(
    supernova.red('.zero colors'),
    '\27[31m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:red(':zero colors'),
    ':zero colors'
  )

  lu.assertEquals(
    supernova.bright_red('.zero colors'),
    '\27[91m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:bright_red(':zero colors'),
    ':zero colors'
  )

  lu.assertEquals(
    supernova.bg_red('.zero colors'),
    '\27[41m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:bg_red(':zero colors'),
    ':zero colors'
  )

  lu.assertEquals(
    supernova.bg_bright_red('.zero colors'),
    '\27[101m.zero colors\27[0m'
  )

  lu.assertEquals(
    supernova:bg_bright_red(':zero colors'),
    ':zero colors'
  )

  lu.assertEquals(
    supernova.gradient('.zero colors', { '#eb3434', '#343aeb'}),
    '\27[38;2;235;52;52m.\27[0m\27[38;2;218;52;68mz\27[0m\27[38;2;201;53;85me\27[0m\27[38;2;185;53;101mr\27[0m\27[38;2;168;54;118mo\27[0m\27[38;2;151;54;135m \27[0m\27[38;2;135;55;151mc\27[0m\27[38;2;118;55;168mo\27[0m\27[38;2;101;56;185ml\27[0m\27[38;2;85;56;201mo\27[0m\27[38;2;68;57;218mr\27[0m\27[38;2;52;58;235ms\27[0m'
  )

  lu.assertEquals(
    supernova:gradient(':zero colors', { '#eb3434', '#343aeb'}),
    ':zero colors'
  )
end

function testStyle()
  supernova:init()

  supernova:register('rainbow', 'lolcat').gradient({ '#ff0000', '#0000ff' })

  lu.assertEquals(
    supernova.lolcat.rainbow('lorem'),
    '\27[38;2;255;0;0ml\27[0m'..
    '\27[38;2;191;0;63mo\27[0m'..
    '\27[38;2;127;0;127mr\27[0m'..
    '\27[38;2;63;0;191me\27[0m'..
    '\27[38;2;0;0;255mm\27[0m'
  )

  lu.assertEquals(
    supernova.lolcat:rainbow('lorem'),
    '\27[38;2;255;0;0ml\27[0m'..
    '\27[38;2;191;0;63mo\27[0m'..
    '\27[38;2;127;0;127mr\27[0m'..
    '\27[38;2;63;0;191me\27[0m'..
    '\27[38;2;0;0;255mm\27[0m'
  )

  supernova:disable()

  lu.assertEquals(
    supernova.lolcat.rainbow('lorem'),
    '\27[38;2;255;0;0ml\27[0m'..
    '\27[38;2;191;0;63mo\27[0m'..
    '\27[38;2;127;0;127mr\27[0m'..
    '\27[38;2;63;0;191me\27[0m'..
    '\27[38;2;0;0;255mm\27[0m'
  )

  lu.assertEquals(supernova.lolcat:rainbow('lorem'), 'lorem')
end

function testBackgroundGradient()
  supernova:init()

  lu.assertEquals(
    supernova.bg_gradient('lorem', { '#ff0000', '#0000ff' }),
    '\27[48;2;255;0;0ml\27[0m\27[48;2;191;0;63mo\27[0m'..
    '\27[48;2;127;0;127mr\27[0m\27[48;2;63;0;191me\27[0m'..
    '\27[48;2;0;0;255mm\27[0m'
  )
end

function testColorGradient()
  supernova:init()

  lu.assertEquals(
    supernova.gradient(
      'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.\nNunc tristique blandit leo.',
      { '#ff0000', '#00ff00', '#0000ff', '#fbff00' }
    ),
    '\27[38;2;255;0;0mL\27[0m\27[38;2;226;28;0mo\27[0m\27[38;2;198;56;0mr\27[0m\27[38;2;170;85;0me\27[0m\27[38;2;141;113;0mm\27[0m\27[38;2;113;141;0m \27[0m\27[38;2;84;170;0mi\27[0m\27[38;2;56;198;0mp\27[0m\27[38;2;28;226;0ms\27[0m\27[38;2;0;255;0mu\27[0m\27[38;2;0;255;0mm\27[0m\27[38;2;0;226;28m \27[0m\27[38;2;0;198;56md\27[0m\27[38;2;0;170;85mo\27[0m\27[38;2;0;141;113ml\27[0m\27[38;2;0;113;141mo\27[0m\27[38;2;0;84;170mr\27[0m\27[38;2;0;56;198m \27[0m\27[38;2;0;28;226ms\27[0m\27[38;2;0;0;255mi\27[0m\27[38;2;0;0;255mt\27[0m\27[38;2;27;28;226m \27[0m\27[38;2;55;56;198ma\27[0m\27[38;2;83;85;170mm\27[0m\27[38;2;111;113;141me\27[0m\27[38;2;139;141;113mt\27[0m\27[38;2;167;170;84m,\27[0m\n\27[38;2;255;0;0mc\27[0m\27[38;2;226;28;0mo\27[0m\27[38;2;198;56;0mn\27[0m\27[38;2;170;85;0ms\27[0m\27[38;2;141;113;0me\27[0m\27[38;2;113;141;0mc\27[0m\27[38;2;84;170;0mt\27[0m\27[38;2;56;198;0me\27[0m\27[38;2;28;226;0mt\27[0m\27[38;2;0;255;0mu\27[0m\27[38;2;0;255;0mr\27[0m\27[38;2;0;226;28m \27[0m\27[38;2;0;198;56ma\27[0m\27[38;2;0;170;85md\27[0m\27[38;2;0;141;113mi\27[0m\27[38;2;0;113;141mp\27[0m\27[38;2;0;84;170mi\27[0m\27[38;2;0;56;198ms\27[0m\27[38;2;0;28;226mc\27[0m\27[38;2;0;0;255mi\27[0m\27[38;2;0;0;255mn\27[0m\27[38;2;27;28;226mg\27[0m\27[38;2;55;56;198m \27[0m\27[38;2;83;85;170me\27[0m\27[38;2;111;113;141ml\27[0m\27[38;2;139;141;113mi\27[0m\27[38;2;167;170;84mt\27[0m\27[38;2;195;198;56m.\27[0m\n\27[38;2;255;0;0mN\27[0m\27[38;2;226;28;0mu\27[0m\27[38;2;198;56;0mn\27[0m\27[38;2;170;85;0mc\27[0m\27[38;2;141;113;0m \27[0m\27[38;2;113;141;0mt\27[0m\27[38;2;84;170;0mr\27[0m\27[38;2;56;198;0mi\27[0m\27[38;2;28;226;0ms\27[0m\27[38;2;0;255;0mt\27[0m\27[38;2;0;255;0mi\27[0m\27[38;2;0;226;28mq\27[0m\27[38;2;0;198;56mu\27[0m\27[38;2;0;170;85me\27[0m\27[38;2;0;141;113m \27[0m\27[38;2;0;113;141mb\27[0m\27[38;2;0;84;170ml\27[0m\27[38;2;0;56;198ma\27[0m\27[38;2;0;28;226mn\27[0m\27[38;2;0;0;255md\27[0m\27[38;2;0;0;255mi\27[0m\27[38;2;27;28;226mt\27[0m\27[38;2;55;56;198m \27[0m\27[38;2;83;85;170ml\27[0m\27[38;2;111;113;141me\27[0m\27[38;2;139;141;113mo\27[0m\27[38;2;167;170;84m.\27[0m'
  )

  lu.assertEquals(
    supernova.gradient('', { '#ff0000', '#00ff00', '#0000ff', '#fbff00' }),
    ''
  )

  lu.assertEquals(
    supernova.gradient('h', { '#ff0000', '#00ff00', '#0000ff', '#fbff00' }),
    '\27[38;2;255;0;0mh\27[0m'
  )

  lu.assertEquals(
    supernova.gradient('hi', { '#ff0000', '#00ff00', '#0000ff', '#fbff00' }),
    '\27[38;2;255;0;0mh\27[0m\27[38;2;0;255;0mi\27[0m'
  )

  lu.assertEquals(
    supernova.gradient('.enabled', { '#ff0000', '#0000ff' }),
    '\27[38;2;255;0;0m.\27[0m\27[38;2;218;0;36me\27[0m'..
    '\27[38;2;182;0;72mn\27[0m\27[38;2;145;0;109ma\27[0m'..
    '\27[38;2;109;0;145mb\27[0m\27[38;2;72;0;182ml\27[0m'..
    '\27[38;2;36;0;218me\27[0m\27[38;2;0;0;254md\27[0m'
  )

  lu.assertEquals(
    supernova.gradient('lorem ipsum dolor sit amet', { '#ff0000', '#00ff00', '#0000ff' }),
    '\27[38;2;255;0;0ml\27[0m\27[38;2;233;21;0mo\27[0m'..
    '\27[38;2;212;42;0mr\27[0m\27[38;2;191;63;0me\27[0m'..
    '\27[38;2;170;85;0mm\27[0m\27[38;2;148;106;0m \27[0m'..
    '\27[38;2;127;127;0mi\27[0m\27[38;2;106;148;0mp\27[0m'..
    '\27[38;2;85;170;0ms\27[0m\27[38;2;63;191;0mu\27[0m'..
    '\27[38;2;42;212;0mm\27[0m\27[38;2;21;233;0m \27[0m'..
    '\27[38;2;0;255;0md\27[0m\27[38;2;0;255;0mo\27[0m'..
    '\27[38;2;0;233;21ml\27[0m\27[38;2;0;212;42mo\27[0m'..
    '\27[38;2;0;191;63mr\27[0m\27[38;2;0;170;85m \27[0m'..
    '\27[38;2;0;148;106ms\27[0m\27[38;2;0;127;127mi\27[0m'..
    '\27[38;2;0;106;148mt\27[0m\27[38;2;0;85;170m \27[0m'..
    '\27[38;2;0;63;191ma\27[0m\27[38;2;0;42;212mm\27[0m'..
    '\27[38;2;0;21;233me\27[0m\27[38;2;0;0;255mt\27[0m'
  )
end

function testSimpleGradient()
  supernova:init()

  lu.assertEquals(
    supernova.gradient('.enabled', '#ff0000', '#0000ff'),
    '\27[38;2;255;0;0m.\27[0m\27[38;2;218;0;36me\27[0m'..
    '\27[38;2;182;0;72mn\27[0m\27[38;2;145;0;109ma\27[0m'..
    '\27[38;2;109;0;145mb\27[0m\27[38;2;72;0;182ml\27[0m'..
    '\27[38;2;36;0;218me\27[0m\27[38;2;0;0;254md\27[0m'
  )

  lu.assertEquals(
    supernova:gradient(':enabled', '#ff0000', '#0000ff'),
    '\27[38;2;255;0;0m:\27[0m\27[38;2;218;0;36me\27[0m'..
    '\27[38;2;182;0;72mn\27[0m\27[38;2;145;0;109ma\27[0m'..
    '\27[38;2;109;0;145mb\27[0m\27[38;2;72;0;182ml\27[0m'..
    '\27[38;2;36;0;218me\27[0m\27[38;2;0;0;254md\27[0m'
  )

  supernova:disable()

  lu.assertEquals(
    supernova.gradient('.disabled', '#ff0000', '#0000ff'),
    '\27[38;2;255;0;0m.\27[0m\27[38;2;223;0;31md\27[0m'..
    '\27[38;2;191;0;63mi\27[0m\27[38;2;159;0;95ms\27[0m'..
    '\27[38;2;127;0;127ma\27[0m\27[38;2;95;0;159mb\27[0m'..
    '\27[38;2;63;0;191ml\27[0m\27[38;2;31;0;223me\27[0m'..
    '\27[38;2;0;0;255md\27[0m'
  )

  lu.assertEquals(supernova:gradient(':disabled', '#ff0000', '#0000ff'), ':disabled')
end

function testCode()
  supernova:init()

  lu.assertEquals(supernova.red('.enabled'), '\27[31m.enabled\27[0m')
  lu.assertEquals(supernova:red(':enabled'), '\27[31m:enabled\27[0m')

  lu.assertEquals(supernova.bg_red('.enabled'), '\27[41m.enabled\27[0m')
  lu.assertEquals(supernova:bg_red(':enabled'), '\27[41m:enabled\27[0m')

  lu.assertEquals(supernova.color('.enabled', 178), '\27[38;5;178m.enabled\27[0m')
  lu.assertEquals(supernova:color(':enabled', 178), '\27[38;5;178m:enabled\27[0m')

  lu.assertEquals(supernova.bg_red('.enabled'), '\27[41m.enabled\27[0m')
  lu.assertEquals(supernova:bg_red(':enabled'), '\27[41m:enabled\27[0m')

  lu.assertEquals(supernova.bg('.enabled', 178), '\27[48;5;178m.enabled\27[0m')
  lu.assertEquals(supernova:bg(':enabled', 178), '\27[48;5;178m:enabled\27[0m')

  lu.assertEquals(supernova.background('.enabled', 178), '\27[48;5;178m.enabled\27[0m')
  lu.assertEquals(supernova:background(':enabled', 178), '\27[48;5;178m:enabled\27[0m')

  supernova:disable()

  lu.assertEquals(supernova.red('.disabled'), '\27[31m.disabled\27[0m')
  lu.assertEquals(supernova:red(':disabled'), ':disabled')

  lu.assertEquals(supernova.color('.disabled', 178), '\27[38;5;178m.disabled\27[0m')
  lu.assertEquals(supernova:color(':disabled', 178), ':disabled')

  lu.assertEquals(supernova.bg_red('.disabled'), '\27[41m.disabled\27[0m')
  lu.assertEquals(supernova:bg_red(':disabled'), ':disabled')

  lu.assertEquals(supernova.bg('.disabled', 178), '\27[48;5;178m.disabled\27[0m')
  lu.assertEquals(supernova:bg(':disabled', 178), ':disabled')

  lu.assertEquals(supernova.background('.disabled', 178), '\27[48;5;178m.disabled\27[0m')
  lu.assertEquals(supernova:background(':disabled', 178), ':disabled')
end

function testHex()
  supernova:init()

  lu.assertEquals(
    supernova.color('.enabled', '#9b489b'),
    '\27[38;2;155;72;155m.enabled\27[0m'
  )

  lu.assertEquals(
    supernova:color(':enabled', '#9b489b'),
    '\27[38;2;155;72;155m:enabled\27[0m'
  )

  supernova:disable()

  lu.assertEquals(
    supernova.color('.disabled', '#9b489b'),
    '\27[38;2;155;72;155m.disabled\27[0m'
  )

  lu.assertEquals(supernova:color(':disabled', '#9b489b'), ':disabled')
end

function testRgb()
  supernova:init()

  lu.assertEquals(
    supernova.color('.enabled', {72, 155, 120}),
    '\27[38;2;72;155;120m.enabled\27[0m'
  )

  lu.assertEquals(
    supernova.color('.enabled', 72, 155, 120),
    '\27[38;2;72;155;120m.enabled\27[0m'
  )

  lu.assertEquals(
    supernova:color(':enabled', {72, 155, 120}),
    '\27[38;2;72;155;120m:enabled\27[0m'
  )

  lu.assertEquals(
    supernova:color(':enabled', 72, 155, 120),
    '\27[38;2;72;155;120m:enabled\27[0m'
  )

  supernova:disable()

  lu.assertEquals(
    supernova.color('.disabled', {72, 155, 120}),
    '\27[38;2;72;155;120m.disabled\27[0m'
  )

  lu.assertEquals(
    supernova.color('.disabled', 72, 155, 120),
    '\27[38;2;72;155;120m.disabled\27[0m'
  )

  lu.assertEquals(
    supernova:color(':disabled', {72, 155, 120}),
    ':disabled'
  )

  lu.assertEquals(
    supernova:color(':disabled', 72, 155, 120),
    ':disabled'
  )
end

os.exit(lu.LuaUnit.run())
