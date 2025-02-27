-- Load defaults
require("nvchad.configs.lspconfig").defaults()
local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"
local aerial = require "aerial"

local function on_attach(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    if aerial and aerial.on_attach then
      aerial.on_attach(client, bufnr)
    else
      vim.notify("Warning: Aerial's on_attach is nil.", vim.log.levels.WARN)
    end
  end

  -- Call NvChad's default on_attach if it exists
  if nvlsp.on_attach then
    nvlsp.on_attach(client, bufnr)
  else
    vim.notify("Warning: NvChad's on_attach is nil.", vim.log.levels.WARN)
  end
end

local servers = {
  "lua_ls",
  "html",
  "cssls",
  "gopls",
  "bashls",
  "diagnosticls",
  "docker_compose_language_service",
  "dockerls",
  "htmx",
  "jsonls",
  "tailwindcss",
  "templ",
  "pyright",
}

-- Setup LSP servers with Aerial on_attach
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach, -- Use the new on_attach function
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
