local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "lemminx", "clangd", "pyright", "bashls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.gopls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  -- settings = {
  --   gopls = {
  --     hints = {
  --       assignVariableTypes = true,
  --       compositeLiteralFields = true,
  --       compositeLiteralTypes = true,
  --       constantValues = true,
  --       functionTypeParameters = true,
  --       parameterNames = true,
  --       rangeVariableTypes = true,
  --     },
  --   },
  -- },
}

-- lspconfig.yamlls.setup {
--   settings = {
--     yaml = {
--       schemas = {
--         kubernetes = "*.yaml",
--         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
--         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
--         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
--         ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
--         ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
--         ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
--         ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
--         ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
--         ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
--         ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
--         ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
--         ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
--       },
--     },
--   },
-- }
