local TableHelper = {}

function TableHelper.pack(...)
  if table.pack ~= nil then
    return table.pack(...)
  end

  return { n = select("#", ...), ... }
end

function TableHelper.unpack(...)
  if table.unpack ~= nil then
    return table.unpack(...)
  end

  return unpack(...)
end

return TableHelper
