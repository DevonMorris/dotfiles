local lspkind = require("lspkind")
local ls = require("luasnip")

local cmp = require("cmp")
local types = require("cmp.types")
cmp.setup({
    snippet = {
        expand = function(args)
            ls.lsp_expand(args.body)
        end,
    },
    sources = {
        {
            name = "nvim_lsp",
            entry_filter = function(entry, ctx)
                local entry_type = types.lsp.CompletionItemKind[entry:get_kind()]
                local filtered_values = { 'Text', 'Snippet' }
                for _, value in ipairs(filtered_values) do
                    if entry_type == value then
                        return false
                    end
                end
                return true
            end
        },
        { name = "path" },
        { name = "luasnip" },
        { name = "buffer", keyword_length = 3 },
    },
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            mode = "text",
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[lsp]",
                path = "[path]",
            },
        }),
    },
    mapping = {
        ["<C-j>"] = cmp.mapping(cmp.mapping.scroll_docs(4)),
        ["<C-k>"] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
        ["<C-p>"] = cmp.mapping(
            cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }),
            { "i", "c" }
        ),
        ["<C-n>"] = cmp.mapping(
            cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }),
            { "i", "c" }
        ),
        ["<C-y>"] = cmp.mapping(
            cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            }),
            { "i", "c" }
        ),
    },
    preselect = cmp.PreselectMode.None,
})
