-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Tiltfiles are Starlark: own filetype (for tilt_ls), highlighted with the starlark parser
vim.filetype.add({
  filename = { Tiltfile = "tiltfile" },
  pattern = { [".*%.tiltfile"] = "tiltfile" },
})
vim.treesitter.language.register("starlark", "tiltfile")

-- .env files aren't scripts: own filetype so bashls/shellcheck skip them, bash highlighting
vim.filetype.add({
  filename = { [".env"] = "dotenv" },
  pattern = {
    -- a different key than util.dot's "%.env%.[%w_.-]+" = "sh", so the priority wins over it
    [".*%.env%.[%w_.-]+"] = { "dotenv", { priority = 10 } },
    [".*%.env"] = "dotenv",
  },
})
vim.treesitter.language.register("bash", "dotenv")
