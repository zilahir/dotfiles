local map = vim.keymap.set
local mouse = vim.opt.mouse
local Util = require("lazyvim.util")
local wk = require("which-key")

-- disable mouse
mouse = ""

map("t", "<C-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("n", "<leader>í", function()
  require("trouble").toggle()
end)
map("n", "<leader>í", function()
  require("trouble").toggle("diagnostics")
end)
map("n", "<leader>d", vim.diagnostic.open_float)
map("n", "<leader>gb", function()
  require("gitsigns").blame_line({ full = true })
end)

-- disabling arrow keys

local opts = { noremap = true, silent = true }

-- normal mode
map("n", "<Up>", "<Nop>", opts)
map("n", "<Down>", "<Nop>", opts)
map("n", "<Left>", "<Nop>", opts)
map("n", "<Right>", "<Nop>", opts)

-- insert mode
-- map('i', '<Up>', '<Nop>', opts)
-- map('i', '<Down>', '<Nop>', opts)
-- map('i', '<Left>', '<Nop>', opts)
-- map('i', '<Right>', '<Nop>', opts)

-- visual block mode
map("v", "<Up>", "<Nop>", opts)
map("v", "<Down>", "<Nop>", opts)
map("v", "<Left>", "<Nop>", opts)
map("v", "<Right>", "<Nop>", opts)

-- quick vertical navigation
map("n", "<C-j>", "10j", { noremap = true, silent = true })
map("n", "<C-k>", "10k", { noremap = true, silent = true })

-- copilot setup

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- jumping to the end of the line
vim.api.nvim_set_keymap("n", "1", "$", { noremap = true, silent = true })

-- disable continue comments
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
  end,
})

-- latex compile
vim.api.nvim_set_keymap("n", "<leader>xc", "<Plug>(vimtex-compile)", { noremap = false, silent = true })

-- yanking entire function
vim.api.nvim_set_keymap("n", "<leader>yf", "yVaB", { noremap = false, silent = true })
-- yanking entire file
vim.api.nvim_set_keymap("n", "<leader>yff", "1, $y", { noremap = false, silent = true })

-- wk.add({
--   { "<leader>yf", "yVaB", desc = "Yank function", group = "Yank" },
-- }, {
--   prefix = "<leader>",
-- })
