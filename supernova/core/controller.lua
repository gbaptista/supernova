local Theme = require 'supernova.core.theme'
local Style = require 'supernova.core.style'
local ANSI = require 'supernova.core.ansi'
local ChainMetatable = require 'supernova.core.chain_metatable'
local Color = require 'supernova.core.color'
local Sgr = require 'supernova.core.sgr'

local Controller = {
  is_controller = true,
  enabled = true,
  chain = {},
  style_to_register = nil,
  handlers = { default = {} },
  styles = { default = {} },
  active_theme = 'default',
  colors = 'true-color'
}

function Controller:init()
  self.enabled = true
  self.chain = {}
  self.style_to_register = nil
  self.handlers = { default = {} }
  self.styles = { default = {} }
  self.active_theme = 'default'

  -- TODO:
  -- 0 8 16 256 true-color
  self.colors = 'true-color'
  -- echo $COLORTERM

  local env_colors = os.getenv('SUPERNOVA_COLORS')

  if env_colors ~= nil then
    if tostring(tonumber(env_colors)) == env_colors then
      self.colors = tonumber(env_colors)
    elseif env_colors == 't' or env_colors == 'true_color' then
      self.colors = 'true-color'
    else
      self.colors = env_colors
    end
  end

  self.handlers.default['apply_command'] = Controller.apply_command

  for _, style in pairs(ANSI.SGR_COMMANDS) do
    Style.register(self, style)
  end

  Style.register(self, { identifier = 'gradient',   command = 'gradient' })
  Style.register(self, { identifier = 'bg_gradient',   command = 'bg_gradient' })
  Style.register(self, { identifier = 'background_gradient',   command = 'background_gradient' })
end

function Controller:set_colors(colors)
  if colors == 't' or colors == 'true_color' then
    colors = 'true-color'
  end

  self.colors = colors
end

Controller['set-colors'] = Controller.set_colors

function Controller:enable()
  self.enabled = true
end

function Controller:disable()
  self.enabled = false
end

function Controller:set_theme(theme)
  Theme.set(self, theme)
end

Controller['set-theme'] = Controller.set_theme

function Controller:get_theme(identifier)
  return Theme.get(self, identifier)
end

Controller['get-theme'] = Controller.get_theme

function Controller.apply_command(a, b, c, d, e, f)
  local instance, content, command, extra

  if type(a) == 'table' and a.is_controller then
    instance, content, command = a, b, c
    extra = {d, e, f}
  else
    content, command = a, b
    extra = {c, d, e}
  end

  if instance ~= nil and not instance.enabled then
    return content
  end

  local colors = 'true-color'

  if instance ~= nil then
    colors = instance.colors
  end

  if command == 'gradient' or command == 'bg_gradient' or command == 'background_gradient' then
    local sgr_code = ANSI.SGR_CODES.color

    if command == 'bg_gradient' or command == 'background_gradient' then
      sgr_code = ANSI.SGR_CODES.background
    end

    if type(extra[1]) ~= 'table' and extra[2] ~= nil then
      return Color.apply_gradient(content, sgr_code, { extra[1], extra[2] }, colors)
    else
      return Color.apply_gradient(content, sgr_code, extra[1], colors)
    end

  elseif(
    command == ANSI.SGR_CODES.color or
    command == ANSI.SGR_CODES.background or
    command == ANSI.SGR_CODES.underline_color
  ) then
    if type(extra[1]) == 'string' then
      return Color.apply_string(content, command, extra[1], colors)
    elseif type(extra[1]) == 'table' then
      return Color.apply_rgb(content, command, extra[1], colors)
    elseif extra[3] ~= nil then
      return Color.apply_rgb(content, command, { extra[1], extra[2], extra[3] }, colors)
    else
      return Color.apply_code(content, command, extra[1], colors)
    end
  end

  local sgr_modifier = nil

  if type(extra[1]) == 'boolean' and extra[1] then
    sgr_modifier = '1'
  end

  if (
    (command >= 30 and command <= 37)
    or (command >= 40 and command <= 47)
    or (command >= 90 and command <= 97)
    or (command >= 100 and command <= 107)
  ) then
    return Color.apply_sgr_code(content, command, sgr_modifier, colors)
  end

  return Sgr.apply(content, command, sgr_modifier)
end

Controller = setmetatable(Controller, ChainMetatable)

return Controller
