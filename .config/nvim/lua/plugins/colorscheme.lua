return {
    {
        "folke/tokyonight.nvim",
        lazy = true,
        opts = {
            style = "night",
            on_highlights = function(hl, c)
                hl.MiniIndentscopeSymbol = {
                    fg = "#3b4261"
                }
                hl.IblIndent = {
                    fg = "#242635"
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
    }
}
