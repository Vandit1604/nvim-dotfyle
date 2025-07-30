-- configs/diagnostics.lua

-- Define custom diagnostic signs for the sign column
local signs = {
  Error = " ",
  Warn = " ",
  Hint = " ",
  Info = " ",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Diagnostic config
vim.diagnostic.config {
  virtual_text = {
    prefix = "●", -- Change to "", "■", etc. if you prefer
    spacing = 2,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "if_many", -- or "always"
    header = "",
    prefix = "",
  },
}
