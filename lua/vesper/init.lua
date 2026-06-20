local M = {}

M.config = {
  transparent = false,
  style = "auto",
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.g.colors_name = "vesper"
  vim.o.termguicolors = true

  local palette
  if M.config.style == "light" then
    palette = require("vesper.palette_light")
  elseif M.config.style == "dark" then
    palette = require("vesper.palette")
  else
    if vim.o.background == "light" then
      palette = require("vesper.palette_light")
    else
      palette = require("vesper.palette")
    end
  end

  local colors = vim.deepcopy(palette.colors)

  if M.config.transparent then
    colors.bg = "NONE"
  end

  require("vesper.highlights").setup(colors)
end

return M
