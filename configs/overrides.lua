local M = {}

M.treesitter = {
  ensure_installed = {
    "bash",
    "c",
    "comment",
    "diff",
    "dockerfile",
    "dot",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "lua",
    "make",
    "markdown",
    "markdown_inline",
    "mermaid",
    "python",
    "regex",
    "vim",
    "yaml",
    "cpp",
    "go",
    "gomod",
    "gosum",
    "rust",
    "toml",
    "ron",
    "html",
    "java",
    "javascript",
    "typescript",
    "jsdoc",
    "scss",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "bash-language-server",
    "css-lsp",
    "html-lsp",
    "eslint-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "clangd",
    "clang-format",
    "pyright",
    "black",
    "gopls",
    "gofumpt",
    "shfmt",
    "codelldb",
    "rust-analyzer",
    "rustfmt",
    "taplo",
    "yaml-language-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  respect_buf_cwd = true,
  sync_root_with_cwd = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    update_root = true,
  },
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
      glyphs = {
        default = "󰈚",
        symlink = "",
        folder = {
          default = "󰉋",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
}

M.telescope = {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = function(...)
          return require("telescope.actions").move_selection_next(...)
        end,
        ["<C-k>"] = function(...)
          return require("telescope.actions").move_selection_previous(...)
        end,
        ["<C-p>"] = function(...)
          return require("telescope.actions.layout").toggle_preview(...)
        end,
      },
      n = {
        ["j"] = function(...)
          return require("telescope.actions").move_selection_next(...)
        end,
        ["k"] = function(...)
          return require("telescope.actions").move_selection_previous(...)
        end,
        ["gg"] = function(...)
          return require("telescope.actions").move_to_top(...)
        end,
        ["G"] = function(...)
          return require("telescope.actions").move_to_bottom(...)
        end,
        ["<C-p>"] = function(...)
          return require("telescope.actions.layout").toggle_preview(...)
        end,
      },
    },
    extensions = {
      project = {
        base_dirs = {
          "~/workspace/",
        },
      },
      undo = {
        use_delta = true,
        side_by_side = true,
        layout_strategy = "vertical",
        layout_config = {
          preview_height = 0.4,
        },
      },
    },
    extensions_list = { "themes", "terms", "project", "emoji", "env", "ports", "undo" },
  },
}

return M
