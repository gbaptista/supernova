local String = {}

local ACCENTS = require 'supernova.helpers.accents'

function String.to_identifier(content)
  local identifier = String.remove_accents(content)

  identifier = identifier:gsub('%s+', ' ')
  identifier = String.strip(identifier)
  identifier = identifier:gsub('%s+', '-')

  identifier = String.strip(identifier):lower()

  local key = identifier:gsub('-', '_')

  return identifier, '_' .. key
end

function String.remove_accents(content)
  return content:gsub('[%z\1-\127\194-\244][\128-\191]*', ACCENTS.SHARP_TO_CLEAN)
end

function String.strip(content)
  content = string.gsub(content, '^%s+', '')
  content = string.gsub(content, '%s+$', '')

  return content
end

return String
