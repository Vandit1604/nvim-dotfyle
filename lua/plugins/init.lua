return {
  {
    "leoluz/nvim-dap-go",
  },
  {
    "fatih/vim-go",
    ft = { "go", "gomod" },
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
