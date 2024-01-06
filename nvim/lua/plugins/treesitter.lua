return {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      highlight = {
        enabled = true
      }
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
      })
    end,
}