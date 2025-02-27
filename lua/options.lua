require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local vim = vim
local opt = vim.opt

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 99 -- Keeps folds open by default

-- Custom fold text function using only the default Folded highlight
function _G.CustomFoldText()
  local fold_start_line = vim.fn.getline(vim.v.foldstart) -- First line of the fold
  local fold_size = vim.v.foldend - vim.v.foldstart + 1 -- Number of lines in the fold

  -- Return fold text without applying any custom highlight
  return "⯈ " .. fold_start_line .. "  •••"
end

-- Apply custom fold text function
opt.foldtext = "v:lua.CustomFoldText()"

-- Optional: Customize fill characters for folded lines if needed
opt.fillchars = { fold = "•" } -- Use "·", "-", etc., if desired
