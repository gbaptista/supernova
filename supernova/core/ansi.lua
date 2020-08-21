local ANSI = {}

function ANSI.wrap(content)
  return ANSI.ESCAPE .. content .. ANSI['ESCAPE'] .. ANSI.RESET_CODE
end

ANSI['ESCAPE'] = '\27['

ANSI['RESET_CODE'] = '0m'

ANSI['SGR_CODES'] = {
  color = 38,
  background = 48,
  underline_color = 58
}

ANSI['SGR_COMMANDS'] = {
  { identifier = 'reset',            command = 0 },
  { identifier = 'bold',             command = 1 },
  { identifier = 'faint',            command = 2 },
  { identifier = 'italic',           command = 3 },
  { identifier = 'underline',        command = 4 },

  { identifier = 'slow_blink',       command = 5 },
  { identifier = 'blink',            command = 5 },

  { identifier = 'rapid_blink',      command = 6 },

  { identifier = 'reverse_video',    command = 7 },
  { identifier = 'invert',           command = 7 },
  { identifier = 'reverse',          command = 7 },

  { identifier = 'conceal',          command = 8 },
  { identifier = 'hide',             command = 8 },

  { identifier = 'strike',           command = 9 },
  { identifier = 'crossed_out',      command = 9 },

  -- TODO: 10 Primary (default) font | 11-19 Alternative font

  { identifier = 'fraktur',          command = 20 },

  { identifier = 'doubly_underline', command = 21 },
  { identifier = 'doubly',           command = 21 },
  { identifier = 'bold_off',         command = 21 },

  { identifier = 'normal',           command = 22 },

  { identifier = 'italic_off',       command = 23 },
  { identifier = 'fraktur_off',      command = 23 },

  { identifier = 'underline_off',    command = 24 },

  { identifier = 'blink_off',        command = 25 },

  { identifier = 'proportional_spacing', command = 26 },
  { identifier = 'proportional',         command = 26 },
  { identifier = 'spacing',              command = 26 },

  { identifier = 'reverse_off',      command = 27 },
  { identifier = 'invert_off',       command = 27 },

  { identifier = 'reveal',           command = 28 },

  { identifier = 'strike_off',       command = 29 },
  { identifier = 'crossed_out_off',  command = 29 },

  { identifier = 'black',   command = 30 },
  { identifier = 'red',     command = 31 },
  { identifier = 'green',   command = 32 },
  { identifier = 'yellow',  command = 33 },
  { identifier = 'blue',    command = 34 },
  { identifier = 'magenta', command = 35 },
  { identifier = 'cyan',    command = 36 },
  { identifier = 'white',   command = 37 },

  { identifier = 'color',     command = 38 },

  { identifier = 'default_color',     command = 39 },

  { identifier = 'bg_black',   command = 40 },
  { identifier = 'bg_red',     command = 41 },
  { identifier = 'bg_green',   command = 42 },
  { identifier = 'bg_yellow',  command = 43 },
  { identifier = 'bg_blue',    command = 44 },
  { identifier = 'bg_magenta', command = 45 },
  { identifier = 'bg_cyan',    command = 46 },
  { identifier = 'bg_white',   command = 47 },

  { identifier = 'background_black',   command = 40 },
  { identifier = 'background_red',     command = 41 },
  { identifier = 'background_green',   command = 42 },
  { identifier = 'background_yellow',  command = 43 },
  { identifier = 'background_blue',    command = 44 },
  { identifier = 'background_magenta', command = 45 },
  { identifier = 'background_cyan',    command = 46 },
  { identifier = 'background_white',   command = 47 },

  { identifier = 'bg',     command = 48 },
  { identifier = 'background',     command = 48 },

  { identifier = 'default_bg',     command = 49 },
  { identifier = 'default_background',     command = 49 },

  { identifier = 'proportional_spacing_off', command = 50 },
  { identifier = 'proportional_off',         command = 50 },
  { identifier = 'spacing_off',              command = 50 },

  { identifier = 'framed',        command = 51 },
  { identifier = 'encircled',     command = 52 },
  { identifier = 'overlined',     command = 53 },

  { identifier = 'framed_off',    command = 54 },
  { identifier = 'encircled_off', command = 54 },
  { identifier = 'overlined_off', command = 55 },

  { identifier = 'underline_color', command = 58 },

  { identifier = 'default_underline_color', command = 59 },

  -- 60 .. 65 => Rarely supported

  { identifier = 'superscript',   command = 73 },
  { identifier = 'subscript',     command = 74 },

  { identifier = 'bright_black',   command = 90 },
  { identifier = 'gray',           command = 90 },
  { identifier = 'bright_red',     command = 91 },
  { identifier = 'bright_green',   command = 92 },
  { identifier = 'bright_yellow',  command = 93 },
  { identifier = 'bright_blue',    command = 94 },
  { identifier = 'bright_magenta', command = 95 },
  { identifier = 'bright_cyan',    command = 96 },
  { identifier = 'bright_white',   command = 97 },

  { identifier = 'bg_bright_black',   command = 100 },
  { identifier = 'bg_gray',           command = 100 },
  { identifier = 'bg_bright_red',     command = 101 },
  { identifier = 'bg_bright_green',   command = 102 },
  { identifier = 'bg_bright_yellow',  command = 103 },
  { identifier = 'bg_bright_blue',    command = 104 },
  { identifier = 'bg_bright_magenta', command = 105 },
  { identifier = 'bg_bright_cyan',    command = 106 },
  { identifier = 'bg_bright_white',   command = 107 },

  { identifier = 'background_bright_black',   command = 100 },
  { identifier = 'background_gray',           command = 100 },
  { identifier = 'background_bright_red',     command = 101 },
  { identifier = 'background_bright_green',   command = 102 },
  { identifier = 'background_bright_yellow',  command = 103 },
  { identifier = 'background_bright_blue',    command = 104 },
  { identifier = 'background_bright_magenta', command = 105 },
  { identifier = 'background_bright_cyan',    command = 106 },
  { identifier = 'background_bright_white',   command = 107 }
}

return ANSI
