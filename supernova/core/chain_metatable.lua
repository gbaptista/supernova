local Style = require 'supernova.core.style'
local HELPERS = require 'supernova.core.helpers'
local TableHelper = require 'supernova.helpers.table'

local ChainMetatable = {
  __index = function(controller, key)
    key = key:gsub('-', '_')
    if key == 'helpers' then
      return HELPERS
    elseif HELPERS[key] then
      return HELPERS[key]
    end

    table.insert(controller.chain, key)

    return controller
  end,

  __call = function(controller, a, b, c, d, e, f, g, h, i, j)
    if controller.chain[1] == 'style' then
      local style = {
        chain = controller.chain, params = {a, b, c, d, e, f, g, h, i, j}
      }

      controller.chain = {}

      return style
    end

    local theme = controller.active_theme

    if controller.chain[1] == 'register' and controller.chain[2] == nil then
      if type(a) == 'table' and a.is_controller then
        controller.style_to_register = { identifier = b, theme = c }
      else
        controller.style_to_register = {
          identifier = a,
          theme = b
        }
      end

      if (
        controller.style_to_register.identifier['colors'] ~= nil
        or
        controller.style_to_register.identifier['styles'] ~= nil
      ) then
        local theme_to_register = controller.style_to_register.identifier

        return Style.register_theme(controller, theme_to_register)
      end

      return controller
    end

    local params
    local received_instance = false
    local content

    if controller.chain[1] == 'register' or controller.chain[1] == 'register' then
      if type(a) == 'table' and a.is_controller then
        params = { b, c, d, e, f, g, h, i, j }
      else
        params = { a, b, c, d, e, f, g, h, i, j }
      end

      local last_identifier = controller.chain[#controller.chain]

      local base_style

      if controller.styles[theme] and controller.styles[theme][last_identifier] then
        base_style = controller.styles[theme][last_identifier]
      elseif controller.styles.default[last_identifier] then
        base_style = controller.styles.default[last_identifier]
      else
        controller.chain = {}

        error('unknown style: ' .. last_identifier)
      end

      table.remove(controller.chain, 1)
      table.remove(controller.chain, #controller.chain)

      local new_style = {
        command = base_style.command,
        identifier = controller.style_to_register.identifier,
        theme = controller.style_to_register.theme,
        pre_chain = controller.chain,
        params = params
      }

      Style.register(controller, new_style)

      controller.chain = {}

      return true
    else
      if type(a) == 'table' and a.is_controller then
        received_instance = true
        content = b
        params = { c, d, e, f, g, h, i, j }
      else
        content = a
        params = { b, c, d, e, f, g, h, i, j }
      end
    end

    local theme_candidate = controller.chain[1]:gsub('-', '_')

    if controller.styles[theme_candidate] ~= nil then
      theme = theme_candidate
      table.remove(controller.chain, 1)
    end

    for _, style_key in pairs(controller.chain) do
      style_key = style_key:gsub('-', '_')

      local chain = {}

      if style_key ~= 'apply_command' then
        local style

        if controller.styles[theme] and controller.styles[theme][style_key] then
          style = controller.styles[theme][style_key]
        elseif controller.styles.default[style_key] then
          style = controller.styles.default[style_key]
        else
          controller.chain = {}

          error('unknown style: ' .. style_key)
        end

        if style.params ~= nil and params[1] == nil then
          params = style.params
        end

        for _, pre in pairs(style.pre_chain) do
          table.insert(chain, pre)
        end
      end

      table.insert(chain, style_key)

      for _, key in pairs(chain) do
        local handler

        if controller.handlers[theme] and controller.handlers[theme][key] then
          handler = controller.handlers[theme][key]
        elseif controller.handlers.default[key] then
          handler = controller.handlers.default[key]
        else
          controller.chain = {}

          error('unknown style: ' .. key)
        end

        if received_instance then
          content = handler(controller, content, TableHelper.unpack(params))
        else
          content = handler(content, TableHelper.unpack(params))
        end
      end
    end

    controller.chain = {}

    return content
  end
}

return ChainMetatable
