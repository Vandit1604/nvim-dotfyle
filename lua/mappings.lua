require "nvchad.mappings"

local map = vim.keymap.set

-- General
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- NvimTree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- Quit
map("n", "<leader>q", "<cmd>x<CR>", { desc = "save and close file" })

-- Folding
map("n", "za", "za", { desc = "Toggle fold" })
map("n", "<leader>zA", "zR", { desc = "Open all folds" })
map("n", "<leader>zm", "zxzM", { desc = "Update folds and close all" })
map("n", "<leader>zf", "zf", { desc = "Create fold" })
map("n", "<leader>zd", "zd", { desc = "Delete fold" })

-- Close all buffers other than this one
map("n", "<leader>bc", function()
  local current_buf = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end, { desc = "Close all buffers except current" })

-- Show list of symbols, variables and functions
map("n", "<Leader>lS", function()
  require("telescope.builtin").lsp_document_symbols {
    prompt_title = "Document Symbols",
    layout_strategy = "vertical",
    layout_config = {
      width = 0.6,
      height = 0.6,
    },
    symbol_width = 50,
  }
end, { desc = "Show Symbol Table (Telescope)" })
