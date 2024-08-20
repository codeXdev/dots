vim.g.mapleader = ","

--------------------------------Keybindings------------------------------
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Map <leader>n to toggle_neotree function
vim.api.nvim_set_keymap('n', '<leader>n', '<Cmd>Neotree toggle<CR><CR>', { noremap = true, silent = true })

-- Navigate to previous buffer
vim.api.nvim_set_keymap('n', '<C-;>', ':bp<CR>', { noremap = true })

-- Navigate to next buffer
vim.api.nvim_set_keymap('n', '<C-\'>', ':bn<CR>', { noremap = true })

-- Switch to next tab
vim.api.nvim_set_keymap('n', '<C-Tab>', 'gt', { noremap = true })

-- Switch to previous tab
vim.api.nvim_set_keymap('n', '<C-S-Tab>', 'gT', { noremap = true })

-- Open a new tab
vim.api.nvim_set_keymap('n', '<S-t>', ':tabnew<CR>', { noremap = true, silent = true })

-- Split horizontally
vim.api.nvim_set_keymap('n', '<Leader>h', ':<C-u>split<CR>', { noremap = true })

-- Split vertically
vim.api.nvim_set_keymap('n', '<Leader>v', ':<C-u>vsplit<CR>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>ev', ':tabedit ~/.config/nvim/init.lua<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>er', ':tabedit ~/.config/nvim/lua/logicvolt/remap.lua<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>ep', ':tabedit ~/.config/nvim/lua/logicvolt/packer.lua<CR>', { noremap = true })


-- Tab Navigation
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })


--In visual mode move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")




vim.keymap.set("n", "<M-k>", ":bp")
vim.keymap.set("n", "<M-j>", ":bn")


--no highlight if leader and space after search
vim.keymap.set('n', '<Leader><space>', function()
    vim.cmd(':nohlsearch')
end, { expr = true, replace_keycodes = true })

vim.api.nvim_set_keymap('n', '<M-enter>', ':call GuiWindowFullScreen((g:GuiWindowFullScreen + 1) % 2)<CR>', { noremap = true })

---------------------------------Commands mapping--------------------------
vim.cmd("cnoreabbrev W! w!")
vim.cmd("cnoreabbrev Q! q!")
vim.cmd("cnoreabbrev Qa qa")
vim.cmd("cnoreabbrev Qall! qall!")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev Wa wa")
vim.cmd("cnoreabbrev wQ wq")
vim.cmd("cnoreabbrev WQ wq")
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev Qall qall")
