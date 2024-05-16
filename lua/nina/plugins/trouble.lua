return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
    keys = {
        { "<leader>xx", "<cmd>TroubleToggle<CR>",                       desc = "Open/close trouble list" },
        { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Open trouble workspace diagnostics" },
        { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>",  desc = "Open trouble document diagnostics" },
        { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>",              desc = "Open trouble quickfix list" },
        { "<leader>xl", "<cmd>TroubleToggle loclist<CR>",               desc = "Open trouble location list" },
        { "<leader>xt", "<cmd>TodoTrouble<CR>",                         desc = "Open todos in trouble" },
        {
            "[q",
            function()
                if require("trouble").is_open() then
                    require("trouble").previous({ skip_groups = true, jump = true })
                else
                    local ok, err = pcall(vim.cmd.cprev)
                    if not ok then
                        vim.notify(err, vim.log.levels.ERROR)
                    end
                end
            end,
            desc = "Previous Trouble/Quickfix Item",
        },
    },
}
