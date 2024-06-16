-- This is really funky, but some autocommands only works if filetype plugin on
-- is called before. Although this is set by default in neovim I believe it is
-- called later. TODO: If I put this in a /after directory will everything be
-- happier?
vim.cmd([[filetype plugin on]])

-- Yank Highlight
vim.api.nvim_create_augroup("HighlightOnYank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ on_visual = false })
    end,
    group = "HighlightOnYank",
})

-- Don't assume I want a line comment after another line comment
vim.api.nvim_create_augroup("Comment", { clear = true })
vim.api.nvim_create_autocmd(
    { "BufNewFile", "BufRead" },
    { command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o", group = "Comment" }
)

-- Hybrid Numbers: Relative Numbers in Active windows, Norelative number in
-- inactive windows
local switch_rel_num = function(rel_on)
    if vim.api.nvim_win_get_config(0).relative ~= "" then
        return
    end
    vim.o.relativenumber = rel_on
end

vim.api.nvim_create_augroup("HybridNumbers", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave" }, {
    callback = function()
        switch_rel_num(true)
    end,
    group = "HybridNumbers",
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter" }, {
    callback = function()
        switch_rel_num(false)
    end,
    group = "HybridNumbers",
})

-- Remove whitespace on save
vim.api.nvim_create_augroup("StripWhitespace", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", { command = "%s/\\s\\+$//e", group = "StripWhitespace" })

-- Retab on save
vim.api.nvim_create_augroup("Retab", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local excludes = { "make" }
        for _, exclude in pairs(excludes) do
            if vim.bo.filetype == exclude then
                return
            end
        end
        vim.cmd("retab")
    end,
    group = "Retab" }
)

-- Format code on save
vim.api.nvim_create_augroup("CodeFormat", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.hpp", "*.h", "*.cpp", "*.tpp", "*.c", "*.rs", "*.lua", "*.cmake", "CMakeLists.txt" },
    command = "lua vim.lsp.buf.format({async = true})",
    group = "CodeFormat",
})
