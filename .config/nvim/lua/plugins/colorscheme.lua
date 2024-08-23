return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      on_highlights = function(hl, c)
        hl.MiniIndentscopeSymbol = {
          bg = "none",
        }
        hl.IblIndent = {
          fg = "#242635",
        }
        hl["@keyword.return"] = {
          fg = "#f7768e",
        }
        hl["@keyword.lua"] = {
          fg = "#f7768e",
        }
        hl["@constructor.tsx"] = { link = "@tag.tsx" }
        hl["@tag.attribute.tsx"] = { link = "@parameter" }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
