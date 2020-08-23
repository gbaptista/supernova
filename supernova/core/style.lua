local Style = {}
local ColorHelper = require 'supernova.helpers.color'
local TableHelper = require 'supernova.helpers.table'

function Style.register_theme(controller, theme_to_register)
  local registered_styles = {}

  local rainbow_colors = {}

  if theme_to_register.colors then
    for identifier, color in pairs(theme_to_register.colors) do
      local rgb_color = ColorHelper.hex_to_rgb(color)

      if type(identifier) == 'number' then
        identifier = ColorHelper.nearest(rgb_color).colors[1].identifier
      end

      registered_styles[identifier] = true

      table.insert(rainbow_colors, rgb_color)

      controller.chain = {}
      controller:register(identifier, theme_to_register.identifier).color(color)
    end
  end

  controller.chain = {}

  controller:register('rainbow', theme_to_register.identifier).gradient(rainbow_colors)

  if theme_to_register.styles then
    for alias, style in pairs(theme_to_register.styles) do
      local register = controller:register(alias, theme_to_register.identifier)

      registered_styles[alias] = true

      for _, item in pairs(style.chain) do
        if item ~= 'style' then
          register = register[item]
        end
      end

      register(TableHelper.unpack(style.params))
    end
  end

  local styles = {}

  for style, _ in pairs(registered_styles) do
    table.insert(styles, style)
  end

  table.sort(styles)

  return {
    identifier = theme_to_register.identifier,
    styles = styles
  }
end

function Style.register(controller, style)
  if style.theme == nil then
    style.theme = 'default'
  end

  style.theme = style.theme:gsub('-', '_')

  if style.pre_chain == nil then
    style.pre_chain = {}
  end

  if controller.styles[style.theme] == nil then
    controller.styles[style.theme] = {}
  end

  if controller.handlers[style.theme] == nil then
    controller.handlers[style.theme] = {}
  end

  controller.styles[style.theme][style.identifier] = style

  controller.handlers[style.theme][style.identifier] = function(a, b, c, d, e)
    local instance, content, extra_1, extra_2, extra_3

    if type(a) == 'table' and a.is_controller then
      instance, content, extra_1, extra_2, extra_3 = a, b, c, d, e
    else
      content, extra_1, extra_2, extra_3 = a, b, c, d
    end

    if style.params then
      if extra_1 == nil then
        extra_1, extra_2, extra_3 = TableHelper.unpack(style.params)
      end
    end

    if instance then
      return controller.handlers.default.apply_command(
        instance, content, style.command,
        extra_1, extra_2, extra_3
      )
    else
      return controller.handlers.default.apply_command(
        content, style.command,
        extra_1, extra_2, extra_3
      )
    end
  end

  if style.identifier:find('_') then
    local updated_identifier = style.identifier:gsub('_', '-')

    controller.handlers[style.theme][updated_identifier] = controller.handlers[style.theme][style.identifier]
    controller.styles[style.theme][updated_identifier] = style
  end

  if style.identifier:find('-') then
    local updated_identifier = style.identifier:gsub('-', '_')

    controller.handlers[style.theme][updated_identifier] = controller.handlers[style.theme][style.identifier]
    controller.styles[style.theme][updated_identifier] = style
  end
end

return Style
