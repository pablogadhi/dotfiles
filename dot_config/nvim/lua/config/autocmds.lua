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

-- Restore the session for this cwd (if there is one) on a bare `nvim`
local function restore_session()
  -- `nvim .` and `nvim file` are left alone
  if vim.fn.argc(-1) > 0 then
    return
  end
  require("persistence").load()
end

-- LazyVim loads this file on VeryLazy when nvim starts without args, which is
-- after VimEnter has already fired, so run right away in that case. Scheduling
-- gets us out of the VeryLazy autocmd so the session's buffers still trigger
-- their BufRead/FileType autocmds (the equivalent of `nested = true`).
if vim.v.vim_did_enter == 1 then
  vim.schedule(restore_session)
else
  vim.api.nvim_create_autocmd("VimEnter", {
    group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
    nested = true,
    callback = restore_session,
  })
end

-- Open the symbols sidebar (<leader>cs) the first time an LSP that provides
-- symbols attaches. Opening it earlier finds nothing and trouble just warns.
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("symbols_sidebar", { clear = true }),
--   callback = function(ev)
--     local client = vim.lsp.get_client_by_id(ev.data.client_id)
--     if not (client and client:supports_method("textDocument/documentSymbol")) then
--       return
--     end
--     vim.schedule(function()
--       local trouble = require("trouble")
--       if not trouble.is_open("symbols") then
--         trouble.open({ mode = "symbols", focus = false })
--       end
--     end)
--     return true -- run once
--   end,
-- })
