-- local templ = require("lspconfig.server_configurations.templ")
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
      "saghen/blink.cmp",
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      inlay_hints = { enabled = true },
      diagnostics = {
        virtual_text = false,
        underline = true,
        float = {
          show_header = true,
          source = "if_many",
          border = "rounded",
          focusable = false,
        },
      },
      servers = {
        jinja_lsp = {
          filetypes = { "jinja", "html" },
        },
        vtsls = {
          enabled = false,
        },
        tsserver = {
          enabled = true,
        },
        ts_ls = {
          enabled = true,
        },
        tailwindcss = {},
        lua_ls = {},
      },
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        html = function(_, opts)
          require("lspconfig").html.setup(opts)
          return true
        end,
        templ = function(_, opts)
          opts.cmd_env = opts.cmd_env or {}
          opts.cmd_env.TEMPL_EXPERIMENT = "rawgo"
          require("lspconfig").templ.setup(opts)
          return true
        end,
        lua_ls = function(_, opts)
          require("lspconfig").lua_ls.setup({})
          return true
        end,
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
  },
}
