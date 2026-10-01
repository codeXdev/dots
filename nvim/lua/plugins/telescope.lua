return {
    "nvim-telescope/telescope.nvim",
    tag = "v0.1.9",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local builtin = require("telescope.builtin")

        -- Telescope mappings
        vim.keymap.set("n", "<C-f>", builtin.find_files, { desc = "Telescope find files", noremap = true })
        vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope git files" })
        vim.keymap.set("n", "<C-b>", builtin.buffers, { desc = "Telescope buffers" })
        vim.keymap.set("n", "<C-g>", builtin.live_grep, { desc = "Telescope live grep" })
        vim.keymap.set("n", "<C-S-h>", builtin.help_tags, { desc = "Telescope help tags" })

        --------------------------------------------------------------------
        -- Angular Component Switcher
        --------------------------------------------------------------------
        local function switch_angular_file(ext)
            local file = vim.fn.expand("%:p")
            local base = file:gsub("%.%w+$", "")
            local target = base .. "." .. ext

            if vim.fn.filereadable(target) == 1 then
                vim.cmd("edit " .. target)
            else
                print("File not found: " .. target)
            end
        end

        vim.keymap.set("n", "<leader>ah", function()
            switch_angular_file("html")
        end, { desc = "Switch to component HTML" })

        vim.keymap.set("n", "<leader>ac", function()
            local base = vim.fn.expand("%:p"):gsub("%.%w+$", "")
            if vim.fn.filereadable(base .. ".scss") == 1 then
                vim.cmd("edit " .. base .. ".scss")
            else
                vim.cmd("edit " .. base .. ".css")
            end
        end, { desc = "Switch to component CSS/SCSS" })

        vim.keymap.set("n", "<leader>at", function()
            switch_angular_file("ts")
        end, { desc = "Switch to component TS" })
    end
}
