local map = vim.keymap.set

map("t", "<C-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("n", "<leader>í", function() require("trouble").toggle() end)
map("n", "<leader>íy", function() require("trouble").toggle("quickfix") end)
map('n', '<leader>d', vim.diagnostic.open_float)
map('n', '<leader>gb', function() require("gitsigns").blame_line{full=true} end)

-- disabling arrow keys

local opts = { noremap = true, silent = true }
map('n', '<Up>', '<Nop>', opts)
map('n', '<Down>', '<Nop>', opts)
map('n', '<Left>', '<Nop>', opts)
map('n', '<Right>', '<Nop>', opts)