local Sgr = {}

local ANSI = require 'supernova.core.ansi'

function Sgr.apply(content, sgr_code, sgr_modifier)
  local command = tostring(sgr_code)

  if sgr_modifier then
    command = command .. ';' .. sgr_modifier .. 'm'
  else
    command = command .. 'm'
  end

  return ANSI.wrap(command .. content)
end

return Sgr
