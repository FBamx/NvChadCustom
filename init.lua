-- neovide
if vim.g.neovide then
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.o.guifont = "JetBrainsMono Nerd Font"
  vim.g.neovide_floating_blur_amount_x = 25
  vim.g.neovide_floating_blur_amount_y = 25
  vim.g.neovide_hide_mouse_when_typing = true
  vim.keymap.set("i", "<C-v>", "<C-r>+")
end

-- Highlight on yank
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup "highlight_yank",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- ufo
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
