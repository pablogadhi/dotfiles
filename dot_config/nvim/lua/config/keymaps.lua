-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Open Dashboard
vim.keymap.set("n", "<leader>;", function()
  Snacks.dashboard()
end, { desc = "Dashboard" })

-- Leave terminal mode with <C-q> in every terminal (Sidekick already uses it)
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>", { desc = "Enter Normal Mode" })

-- Toggle tokyonight transparency (re-applies the colorscheme with the updated options)
Snacks.toggle
  .new({
    id = "tokyonight_transparent",
    name = "Transparent Background",
    get = function()
      return require("tokyonight.config").options.transparent
    end,
    set = function(state)
      local opts = require("tokyonight.config").options
      local style = state and "transparent" or "dark"
      opts.transparent = state
      opts.styles.sidebars = style
      opts.styles.floats = style
      vim.cmd.colorscheme(vim.g.colors_name)
    end,
  })
  :map("<leader>uB")

-- Quit and Delete Session
vim.keymap.set("n", "<leader>qD", function()
  local persistence = require("persistence")
  persistence.stop() -- don't write it back on exit
  for _, file in ipairs({ persistence.current(), persistence.current({ branch = false }) }) do
    vim.fn.delete(file)
  end
  vim.cmd("qa")
end, { desc = "Quit and Delete Session" })
