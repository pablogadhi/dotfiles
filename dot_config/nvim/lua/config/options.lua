-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Tiltfiles are Starlark: own filetype (for tilt_ls), highlighted with the starlark parser
vim.filetype.add({
  filename = { Tiltfile = "tiltfile" },
  pattern = { [".*%.tiltfile"] = "tiltfile" },
})
vim.treesitter.language.register("starlark", "tiltfile")
