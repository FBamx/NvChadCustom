---@type MappingsTable
local M = {}

-- In order to disable a default keymap, use
M.disabled = {
  n = {
    -- new buffer
    ["<leader>b"] = { "<cmd> enew <CR>", "New buffer" },
    -- comment
    ["<leader>/"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
    -- toggle nvimtree
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
    -- buffer
    ["<tab>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },
    ["<S-tab>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },
    ["<leader>x"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "Close buffer",
    },
    -- telescope
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    -- telescope mark
    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
  },

  v = {
    ["<leader>/"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
  t = {
    ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-a>"] = { "ggvG", "select all" },
    ["<leader>qq"] = { "<cmd> qa<CR>", "Quit all" },
    ["<A-j>"] = { "<cmd>m .+1<cr>==", "Move down" },
    ["<A-k>"] = { "<cmd>m .-2<cr>==", "Move up" },
    ["<leader>bb"] = { "<cmd> enew <CR>", "New buffer" },
    ["<tab>"] = { "gt", "next tab" },
    ["<S-tab>"] = { "gT", "prior tab" },
    ["<leader>pw"] = { "<cmd>pwd<CR>", "pwd" },
    ["<leader>up"] = { "<cmd>NvChadUpdate<CR>", "pwd" },
  },
  i = {
    ["<A-j>"] = { "<esc><cmd>m .+1<cr>==gi", "Move down" },
    ["<A-k>"] = { "<esc><cmd>m .-2<cr>==gi", "Move up" },
  },
  v = {
    ["<A-j>"] = { ":m '>+1<cr>gv=gv", "Move down" },
    ["<A-k>"] = { ":m '<-2<cr>gv=gv", "Move up" },
  },
  t = {
    ["<Esc>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
  },
}

M.tmuxNavigator = {
  plugin = true,
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "tmux h" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "tmux l" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "tmux j" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "tmux k" },
  },
}

M.SymbolOutline = {
  n = {
    ["<leader>cs"] = { "<cmd> SymbolsOutline<CR>", "open SymbolOutline" },
  },
}

M.Lazy = {
  n = {
    ["<leader>la"] = { "<cmd> Lazy<CR>", "lazy" },
    ["<leader>ls"] = { "<cmd> LspInfo<CR>", "lazy" },
    ["<leader>ma"] = { "<cmd> Mason<CR>", "lazy" },
  },
}

M.Mason = {
  n = {
    ["<leader>ma"] = { "<cmd> Mason<CR>", "lazy" },
  },
}

M.LazyGit = {
  n = {
    ["<leader>gg"] = { "<cmd> LazyGit<CR>", "LazyGit" },
  },
}

M.Git = {
  n = {
    ["<leader>rh"] = { ":lua require 'gitsigns'.reset_hunk()<CR>", "git reset" },
    ["<leader>ph"] = { ":lua require 'gitsigns'.preview_hunk()<CR>", "git preview" },
    ["<leader>gb"] = { ":lua package.loaded.gitsigns.blame_line()<CR>", "git blame_line" },
    ["<leader>td"] = { ":lua require 'gitsigns'.toggle_deleted()<CR>", "git toggle_delete" },
  },
}

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<S-l>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },

    ["<S-h>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<leader>bd"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["gcc"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },

  v = {
    ["gc"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader><leader>"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<leader>/"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>fr"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },

    -- extensions
    ["<leader>fp"] = { "<cmd>Telescope project display_type=full<CR>", "Find project" },
    ["<leader>mo"] = { "<cmd>Telescope emoji<CR>", "emoji" },
    ["<leader>nv"] = { "<cmd>Telescope env<CR>", "env" },
    ["<leader>po"] = { "<cmd>Telescope ports<CR>", "ports" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
  },
}

return M
