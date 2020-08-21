package = "supernova"
version = "0.0.1-1"
source = {
   url = "git+ssh://git@github.com/gbaptista/supernova.git"
}
description = {
   summary = "Terminal string styling.",
   detailed = "Terminal string styling. Support for Fennel, Lua, and Shell.",
   homepage = "https://github.com/gbaptista/supernova",
   license = "MIT"
}
dependencies = {
   "lua >= 5.1"
}
build = {
   type = "builtin",
   modules = {
      ["supernova/cli"] = "supernova/cli.lua",
      ["supernova/cli.handler"] = "supernova/cli/handler.lua",
      ["supernova/cli.view"] = "supernova/cli/view.lua",
      ["supernova/core.ansi"] = "supernova/core/ansi.lua",
      ["supernova/core.chain_metatable"] = "supernova/core/chain_metatable.lua",
      ["supernova/core.color"] = "supernova/core/color.lua",
      ["supernova/core.color_reductor"] = "supernova/core/color_reductor.lua",
      ["supernova/core.controller"] = "supernova/core/controller.lua",
      ["supernova/core.helpers"] = "supernova/core/helpers.lua",
      ["supernova/core.reductor.16_vga"] = "supernova/core/reductor/16_vga.lua",
      ["supernova/core.reductor.256_vga"] = "supernova/core/reductor/256_vga.lua",
      ["supernova/core.sgr"] = "supernova/core/sgr.lua",
      ["supernova/core.style"] = "supernova/core/style.lua",
      ["supernova/core.theme"] = "supernova/core/theme.lua",
      ["supernova/helpers.accents"] = "supernova/helpers/accents.lua",
      ["supernova/helpers.color"] = "supernova/helpers/color.lua",
      ["supernova/helpers.color_names"] = "supernova/helpers/color_names.lua",
      ["supernova/helpers.color_names_by_key"] = "supernova/helpers/color_names_by_key.lua",
      ["supernova/helpers.string"] = "supernova/helpers/string.lua",
      supernova = "supernova.lua"
   },
   install = {
      bin = {
         supernova = "bin/supernova.lua"
      }
   }
}
