return {
  {
    "leoluz/nvim-dap-go",
  },
  {
    "fatih/vim-go",
    ft = { "go" },
    config = function()
      vim.g.go_fmt_command = "goimports" -- Use goimports to organize imports
      vim.g.go_fmt_autosave = 1 -- Auto-format (and organize imports) on save
      vim.g.go_auto_type_info = 0 -- Disable auto type info (disables go doc pop-ups)
      vim.g.go_def_mapping_enabled = 0 -- Disable default mappings if you want to customize

      -- Unmap Shift+K for Go files to disable vim-go godoc
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "go",
        callback = function()
          vim.api.nvim_buf_del_keymap(0, "n", "K")
        end,
      })
    end,
    build = ":GoInstallBinaries",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "go" },
        highlight = { enable = true },
        indent = { enable = true },
        fold = { enable = true },
      }
    end,
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "go",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.diagnostics"
      require "configs.lspconfig"
    end,
  },
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- Treesitter for better symbol parsing
      "nvim-lspconfig", -- LSP for language support
    },
    config = function()
      require("aerial").setup {
        backends = { "lsp", "treesitter", "markdown" },
        layout = {
          min_width = 30,
          default_direction = "right",
        },
        show_guides = true,
        guides = {
          mid_item = "├ ",
          last_item = "└ ",
          nested_top = "│ ",
          whitespace = "  ",
        },
      }
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
