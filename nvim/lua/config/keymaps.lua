-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("t", "<C-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("n", "<leader>í", function() require("trouble").toggle() end)
map("n", "<leader>íy", function() require("trouble").toggle("quickfix") end)
map('n', '<leader>d', vim.diagnostic.open_float)