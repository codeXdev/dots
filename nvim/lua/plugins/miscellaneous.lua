return {
    {
        "tpope/vim-fugitive",
    },
    {
        "mattn/emmet-vim",
        init = function()
            -- Enable all functions in all modes
            vim.g.user_emmet_mode = "a"

            -- Don't install globally
            vim.g.user_emmet_install_global = 0
        end,
        ft = { "html", "css" }, -- Load only for these filetypes
        config = function()
            -- Install Emmet for the specified filetypes
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "html", "css" },
                command = "EmmetInstall",
            })
        end,
    },
    {
        'https://github.com/brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup({})
        end
    }

}
