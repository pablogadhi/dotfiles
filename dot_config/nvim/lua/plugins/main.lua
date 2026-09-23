return {
  -- Tiltfile support: starlark treesitter parser + Tilt's language server (`tilt lsp start`)
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "starlark" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- ships with the tilt binary, not available through Mason
        tilt_ls = { mason = false },
      },
    },
  },

  -- Use a global markdownlint-cli2 config for every project
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          prepend_args = { "--config", vim.fn.stdpath("config") .. "/.markdownlint-cli2.yaml" },
        },
      },
    },
  },
}
