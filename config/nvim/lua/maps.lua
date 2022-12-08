vim.g.mapleader = ' '

local function set_keymap(...)
  vim.api.nvim_set_keymap(...)
end

local opts = { noremap = true , silent = true }

set_keymap('n', '<', '<<', opts)
set_keymap('n', '>', '>>', opts)
set_keymap('v', '<', '<gv', opts)
set_keymap('v', '>', '>gv', opts)

for _, mode in pairs { 'n', 'v' } do
  set_keymap(mode, 'J', 'G', opts)
  set_keymap(mode, 'K', 'gg', opts)
  set_keymap(mode, 'H', '^', opts)
  set_keymap(mode, 'L', '$', opts)

  set_keymap(mode, 'k', 'gk', opts)
  set_keymap(mode, 'gk', 'k', opts)
  set_keymap(mode, 'j', 'gj', opts)
  set_keymap(mode, 'gj', 'j', opts)
end

set_keymap('n', '\\', ':nohlsearch<CR>', opts)

set_keymap('n', 'x', '"_x', opts)

-- Increment/decrement
set_keymap('n', '+', '<C-a>', opts)
set_keymap('n', '-', '<C-x>', opts)

-- Delete a word backwards
set_keymap('n', 'dw', 'vb"_d', opts)

-- Select all
set_keymap('n', '<C-a>', 'gg<S-v>G', opts)

if vim.g.vscode then
  -- vscode
  set_keymap('n', 'gi', ':<C-u>call VSCodeNotify("editor.action.goToImplementation")<CR>', opts)
  set_keymap('n', 'gu', ':<C-u>call VSCodeNotify("editor.action.goToReferences")<CR>', opts)
  set_keymap('n', 'gd', ':<C-u>call VSCodeNotify("editor.action.revealDefinition")<CR>', opts)
  set_keymap('n', 'gt', ':<C-u>call VSCodeNotify("editor.action.goToTypeDefinition")<CR>', opts)

  set_keymap('n', 'ss', ':<C-u>call <SNR>10_split("h")<CR>', opts)
  set_keymap('n', 'sv', ':<C-u>call <SNR>10_split("v")<CR>', opts)

  set_keymap('n', '<C-h>', ':<C-u>call VSCodeNotify("workbench.action.focusLeftGroup")<CR>', opts)
  set_keymap('n', '<C-j>', ':<C-u>call VSCodeNotify("workbench.action.focusBelowGroup")<CR>', opts)
  set_keymap('n', '<C-k>', ':<C-u>call VSCodeNotify("workbench.action.focusAboveGroup")<CR>', opts)
  set_keymap('n', '<C-l>', ':<C-u>call VSCodeNotify("workbench.action.focusRightGroup")<CR>', opts)
else
  -- New tab
  set_keymap('n', 'te', ':tabedit', opts)
  
  -- Split window
  set_keymap('n', 'ss', ':split<Return>', opts)
  set_keymap('n', 'sv', ':vsplit<Return>', opts)
  -- Move window
  set_keymap('n', 'sh', '<C-w>h', opts)
  set_keymap('n', 'sk', '<C-w>k', opts)
  set_keymap('n', 'sj', '<C-w>j', opts)
  set_keymap('n', 'sl', '<C-w>l', opts)
end


-- Resize window
-- set_keymap('n', '<C-w><left>', '<C-w><', opts)
-- set_keymap('n', '<C-w><right>', '<C-w>>', opts)
-- set_keymap('n', '<C-w><up>', '<C-w>+', opts)
-- set_keymap('n', '<C-w><down>', '<C-w>-', opts)
  