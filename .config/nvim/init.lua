
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 2                 -- Number of spaces that a tab counts for
vim.opt.softtabstop = 2             -- Number of spaces to insert for a tab when editing
vim.opt.shiftwidth = 2              -- Number of spaces for indentation
vim.opt.expandtab = true            -- Use spaces instead of tabs


-- Map the auto-close function to insert mode
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', "'", "''<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '"', '""<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<', '<><Left>', { noremap = true, silent = true })
 


