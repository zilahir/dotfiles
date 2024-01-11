return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
          "jose-elias-alvarez/typescript.nvim",
          init = function()
            require("lazyvim.util").lsp.on_attach(function(_, buffer)
              -- stylua: ignore
              vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
              vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
            end)
          end,
        },
        ---@class PluginLspOpts
        opts = {
          ---@type lspconfig.options
          diagnostics = {
            virtual_text = false,
            underline = true,
            float = {
                show_header = true,
                source = 'if_many',
                border = 'rounded',
                focusable = false,
            },
          },
          servers = {
            tsserver = {},
            tailwindcss = {},
          },
          ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
          setup = {
            tsserver = function(_, opts)
              require("typescript").setup({ server = opts })
              return true
            end,
          },
        },
      },
}