local Theme = {}

function Theme.set(controller, identifier)
  controller.active_theme = identifier:gsub('-', '_')
end

function Theme.get(controller, identifier)
  local styles = {}

  local theme_key = identifier:gsub('-', '_')

  for style_key, _ in pairs(controller.styles[theme_key]) do
    if not style_key:find('_') then
      table.insert(styles, style_key)
    end
  end

  table.sort(styles)

  local theme = {
    identifier = identifier,
    styles = styles
  }

  return theme
end

return Theme
