vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

local Justin_Fugitive = vim.api.nvim_create_augroup("Justin_Fugitive", {})

local autocmd = vim.api.nvim_create_autocmd
autocmd("BufWinEnter", {
    group = Justin_Fugitive,
    pattern = "*",
    callback = function()
        print("help", vim.bo.ft)
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = {buffer = bufnr, remap = false}
        -- print("great success", vim.bo.ft, bufnr, vim.inspect(opts))
        vim.keymap.set("n", "<leader>p", function()
            vim.cmd [[ Git push ]]
        end, opts)

        -- rebase always
        vim.keymap.set("n", "<leader>P", function()
            vim.cmd [[ Git pull --rebase ]]
        end, opts)

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
    end,
})
