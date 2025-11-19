return {
    'nvim-telescope/telescope.nvim', tag = 'v0.1.9',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<C-f>', builtin.find_files, { desc = 'Telescope find files', noremap = true})
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git files' })
        vim.keymap.set('n', '<C-b>', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<C-g>', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<C-H>', builtin.help_tags, { desc = 'Telescope help tags' })
    end
}
