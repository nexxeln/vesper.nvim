local M = {}

M.config = {
  transparent = false,
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

  local palette = require("vesper.palette")
  local colors = vim.deepcopy(palette.colors)

  if M.config.transparent then
    colors.bg = "NONE"
  end

  require("vesper.highlights").setup(colors)
end

return M
