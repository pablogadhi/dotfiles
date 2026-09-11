-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Remember Folds
local group = vim.api.nvim_create_augroup("remember_folds", { clear = true })

local function should_save()
  -- skip special buffers: terminals, help, neo-tree, fugitive, etc.
  return vim.bo.buftype == "" and vim.bo.filetype ~= "" and vim.api.nvim_buf_get_name(0) ~= ""
end

vim.api.nvim_create_autocmd("BufWinLeave", {
  group = group,
  pattern = "?*",
  callback = function()
    if should_save() then
      vim.cmd("silent! mkview")
    end
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = group,
  pattern = "?*",
  callback = function()
    if should_save() then
      vim.cmd("silent! loadview")
    end
  end,
})
