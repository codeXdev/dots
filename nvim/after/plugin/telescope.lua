
require('telescope').setup {
    defaults = {
        preview = false,
    }
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-f>', builtin.find_files, { noremap = true})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<C-g>', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
