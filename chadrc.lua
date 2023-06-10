---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "gatekeeper",
  theme_toggle = { "gatekeeper", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = true,
  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    separator_style = "default",
    overriden_modules = nil,
  },
  cmp = {
    style = "atom_colored",
  },
  lsp_semantic_tokens = true,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
