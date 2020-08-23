local supernova = require 'supernova.core.controller'
local View = require 'supernova.cli.view'
local TableHelper = require 'supernova.helpers.table'

local HELPERS = require 'supernova.core.helpers'

local RAINBOW_COLORS = {
  '#FF0000',
  '#FF830E',
  '#FFFF00',
  '#00FF00',
  '#0FF0FE',
  '#233CFE',
  '#C800FF'
}

supernova:init()

local Handler = {}

function Handler.read_buffer()
  local buffer_size = 2^13

  local content = ''

  while true do
    local block = io.read(buffer_size)
    if not block then
      break
    end
    content = content .. block
  end

  return content
end

function Handler.parse_arguments(arguments)
  if arguments == nil then
    arguments = arg
  end

  local params = {}

  local command = ''

  for index, value in pairs(arguments) do
    if index == 1 then
      command = value
    elseif index > 1 then
      if value == tostring(tonumber(value)) then
        table.insert(params, tonumber(value))
      else
        table.insert(params, value)
      end
    end
  end

  return {
    command = command,
    params = params
  }
end

function Handler.run_helpers(chain, _, command, arguments)
  if (
    command == 'rgb_to_hex'
    or (command == 'name' and arguments.params[2] ~= nil)
    or (command == 'inspect' and arguments.params[2] ~= nil)
  ) then
    arguments.params = { arguments.params }
  end

  if View[command] then
    View[command](arguments, chain(TableHelper.unpack(arguments.params)))
  else
    error('Missing View /' .. command .. '/')
  end
end

function Handler.run_gradient(chain, use_instance, arguments)
  arguments.params = { arguments.params }

  Handler.run_chain(chain, use_instance, arguments)
end

function Handler.run_chain(chain, use_instance, arguments)
  local content = Handler.read_buffer()

  local result

  if use_instance then
    result = chain(supernova, content, TableHelper.unpack(arguments.params))
  else
    result = chain(content, TableHelper.unpack(arguments.params))
  end

  io.write(result)
end

function Handler.run_default(_, _, _)
  local content = Handler.read_buffer()

  math.randomseed(os.time())

  local position =  math.random(1, #RAINBOW_COLORS)

  local colors = {}

  while #colors < 7 do
    table.insert(colors, RAINBOW_COLORS[position])
    position = position + 1

    if position > 7 then
      position = 1
    end
  end

  local result = supernova.gradient(content, colors)

  io.write(result .. '\n')
end

function Handler.run()
  local arguments = Handler.parse_arguments()

  if arguments.command == '' then
    Handler.run_default()
    return
  end

  local first_command = nil
  local last_command = nil

  local is_gradient = false

  local use_instance = false

  if arguments.command:find(':') then
    arguments.command = arguments.command:gsub(':', '.')
    use_instance = true
  end

  if arguments.command:sub(1, 1) == '.' then
    arguments.command = arguments.command:sub(2, #arguments.command)
  end

  local chain = supernova

  for partial_command in arguments.command:gmatch('([^%.]*)%.?') do
    partial_command = partial_command:gsub('-', '_')

    if partial_command == 'gradient' then
      is_gradient = true
    end

    if first_command == nil then
      first_command = partial_command
    end
    chain = chain[partial_command]
    last_command = partial_command
  end

  if first_command == 'helpers' or HELPERS[first_command] then
    Handler.run_helpers(chain, use_instance, last_command, arguments)
  elseif is_gradient then
    Handler.run_gradient(chain, use_instance, arguments)
  else
    Handler.run_chain(chain, use_instance, arguments)
  end
end

return Handler
