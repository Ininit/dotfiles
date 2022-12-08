require'lightspeed'.setup {}

local silent = { silent = true }

vim.api.nvim_set_keymap("n", "s", "<Plug>Lightspeed_omni_s", silent)
