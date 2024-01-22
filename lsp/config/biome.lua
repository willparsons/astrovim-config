local util = require "lspconfig.util"

return {
  root_dir = util.root_pattern "biome.json",
  single_file_support = false,
}
