local function configure_vimtex()
    vim.api.nvim_exec(
        [[
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif
]],
        false
    )
    vim.g.vimtex_view_method = "zathura"
    vim.g.tex_flavor = "latex"
end

return {
    -- LaTeX
    {
        "lervag/vimtex",
        config = configure_vimtex,
    },

    -- Rust
    "rust-lang/rust.vim",

    -- Lean
    {
        'Julian/lean.nvim',
        event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        opts = {
            mappings = true,
        },
    },
}
