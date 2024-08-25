local function get_json_path()
  -- check if current file is a json file
  if vim.bo.filetype == "json" then
    local jsonpath = "%{%v:lua.require'jsonpath'.get()%}"
    return jsonpath
  end
  return ""
end

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "phelipetls/jsonpath.nvim" },
    event = "VeryLazy",
    opts = function()
      return {
        options = {
          theme = "tokyonight",
        },
        sections = {
          lualine_c = { "filename", get_json_path },
        },
      }
    end,
  },
}
