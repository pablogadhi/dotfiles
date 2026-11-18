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

  -- Open Claude directly with <leader>aa instead of prompting for a tool (<leader>as still selects)
  {
    "folke/sidekick.nvim",
    keys = {
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle({ name = "claude" })
        end,
        desc = "Sidekick Toggle Claude",
      },
    },
  },

  -- Show hidden and ignored files in the explorer by default (toggle with H and I inside the explorer)
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = { hidden = true, ignored = true },
        },
      },
    },
  },

  -- Wider right sidebar (symbols); edgy's default is 30 columns
  {
    "folke/edgy.nvim",
    optional = true,
    opts = {
      options = {
        right = { size = 35 },
      },
    },
  },

  -- Make tokyonight theme transparent
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  {
    "sphamba/smear-cursor.nvim",
    opts = {
      -- Smear cursor when switching buffers or windows.
      smear_between_buffers = true,

      -- Smear cursor when moving within line or to neighbor lines.
      -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
      smear_between_neighbor_lines = true,

      -- Draw the smear in buffer space instead of screen space when scrolling
      scroll_buffer_space = true,

      -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
      -- Smears and particles will look a lot less blocky.
      legacy_computing_symbols_support = false,

      -- Smear cursor in insert mode.
      -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
      smear_insert_mode = true,
    },
  },
}
