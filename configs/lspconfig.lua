local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "gopls", "pyright", "bashls", "rust_analyzer" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

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

-- rust
-- lspconfig.rust_analyzer.setup {
--   setup = {
--     rust_analyzer = function(_, opts)
--       require("lazyvim.util").on_attach(function(client, buffer)
--         -- stylua: ignore
--         if client.name == "rust_analyzer" then
--           vim.keymap.set("n", "K", "<CMD>RustHoverActions<CR>", { buffer = buffer })
--           vim.keymap.set("n", "<leader>ct", "<CMD>RustDebuggables<CR>", { buffer = buffer, desc = "Run Test" })
--           vim.keymap.set("n", "<leader>dr", "<CMD>RustDebuggables<CR>", { buffer = buffer, desc = "Run" })
--         end
--       end)
--       local mason_registry = require "mason-registry"
--       -- rust tools configuration for debugging support
--       local codelldb = mason_registry.get_package "codelldb"
--       local extension_path = codelldb:get_install_path() .. "/extension/"
--       local codelldb_path = extension_path .. "adapter/codelldb"
--       local liblldb_path = vim.fn.has "mac" == 1 and extension_path .. "lldb/lib/liblldb.dylib"
--           or extension_path .. "lldb/lib/liblldb.so"
--       local rust_tools_opts = vim.tbl_deep_extend("force", opts, {
--         dap = {
--           adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
--         },
--         tools = {
--           hover_actions = {
--             auto_focus = false,
--             border = "none",
--           },
--           inlay_hints = {
--             auto = true,
--             show_parameter_hints = true,
--           },
--         },
--         server = {
--           settings = {
--             ["rust-analyzer"] = {
--               cargo = {
--                 features = "all",
--               },
--               -- Add clippy lints for Rust.
--               checkOnSave = true,
--               check = {
--                 command = "clippy",
--                 features = "all",
--               },
--               procMacro = {
--                 enable = true,
--               },
--             },
--           },
--         },
--       })
--       require("rust-tools").setup(rust_tools_opts)
--       return true
--     end,
--     taplo = function(_, opts)
--       local function show_documentation()
--         if vim.fn.expand "%:t" == "Cargo.toml" and require("crates").popup_available() then
--           require("crates").show_popup()
--         else
--           vim.lsp.buf.hover()
--         end
--       end
--
--       require("lazyvim.util").on_attach(function(client, buffer)
--         -- stylua: ignore
--         if client.name == "taplo" then
--           vim.keymap.set("n", "K", show_documentation, { buffer = buffer })
--         end
--       end)
--       return false -- make sure the base implementation calls taplo.setup
--     end,
--   },
-- }
