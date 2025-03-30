local function get_json_path()
  -- check if current file is a json file
  if vim.bo.filetype == "json" then
    local jsonpath = "%{%v:lua.require'jsonpath'.get()%}"
    return jsonpath
  end
  return ""
end

local function get_enclosing_folder_name()
  local path = vim.fn.expand("%:p:h")
  if path == "" then
    return ""
  end
  local folder_name = path:match("([^/]+)$")
  return folder_name
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
          lualine_c = { get_enclosing_folder_name, "filename", get_json_path },
        },
      }
    end,
  },
}
