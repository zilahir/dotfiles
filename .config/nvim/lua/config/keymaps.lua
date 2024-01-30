local map = vim.keymap.set
local mouse = vim.opt.mouse

-- disable mouse
mouse = ""

map("t", "<C-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("n", "<leader>í", function() require("trouble").toggle() end)
map("n", "<leader>íy", function() require("trouble").toggle("quickfix") end)
map('n', '<leader>d', vim.diagnostic.open_float)
map('n', '<leader>gb', function() require("gitsigns").blame_line{full=true} end)

-- disabling arrow keys

local opts = { noremap = true, silent = true }

-- normal mode
map('n', '<Up>', '<Nop>', opts)
map('n', '<Down>', '<Nop>', opts)
map('n', '<Left>', '<Nop>', opts)
map('n', '<Right>', '<Nop>', opts)

-- insert mode
-- map('i', '<Up>', '<Nop>', opts)
-- map('i', '<Down>', '<Nop>', opts)
-- map('i', '<Left>', '<Nop>', opts)
-- map('i', '<Right>', '<Nop>', opts)

-- visual block mode
map('v', '<Up>', '<Nop>', opts)
map('v', '<Down>', '<Nop>', opts)
map('v', '<Left>', '<Nop>', opts)
map('v', '<Right>', '<Nop>', opts)

-- quick vertical navigation
map('n', '<C-j>', '10j', { noremap = true, silent = true })
map('n', '<C-k>', '10k', { noremap = true, silent = true })