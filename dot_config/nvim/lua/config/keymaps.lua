-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Open Dashboard
vim.keymap.set("n", "<leader>;", function()
  Snacks.dashboard()
end, { desc = "Dashboard" })

-- Quit and Delete Session
vim.keymap.set("n", "<leader>qD", function()
  local persistence = require("persistence")
  persistence.stop() -- don't write it back on exit
  for _, file in ipairs({ persistence.current(), persistence.current({ branch = false }) }) do
    vim.fn.delete(file)
  end
  vim.cmd("qa")
end, { desc = "Quit and Delete Session" })
