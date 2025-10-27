vim.g.mapleader = " "
vim.keymap.set( "n", "<leader>e", ":Neotree toggle<CR>" )
vim.keymap.set( "n", "<leader>cd", ":Ex<CR>" )

-- For conciseness
local opts = { noremap = true, silent = true }

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -1<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +1<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize +1<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize -1<CR>', opts)

