return {
    {
    "hrsh7th/nvim-cmp",
    -- We're using the LazyVim override pattern:
    opts = function(_, opts)
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        -- Function to check if there's a word before the cursor
        local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        if col == 0 then
            return false
        end
        local line_text = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1] or ""
        return line_text:sub(col, col):match("%s") == nil
        end

        -- Override the <Tab> mapping with a "Supertab" approach
        opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            -- Completion menu is open -> select next item 
            cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
            -- If we can expand a snippet or jump in one, do so
            luasnip.expand_or_jump()
        elseif has_words_before() then
            -- If there's a word behind the cursor, trigger completion
            cmp.complete()
        else
            -- Otherwise, insert a literal tab
            fallback()
        end
        end, { "i", "s" })

        -- <S-Tab> to go in reverse
        opts.mapping["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
        end, { "i", "s" })

        cmp.setup.filetype("tex", {
            sources = cmp.config.sources({
                { name = "path" },
                { name = "cmp-vimtex", option = {
                    -- This makes paths relative to the main file
                    is_relative = true,
                    -- You can also specify additional options if needed
                } },
                { name = "nvim_lsp" },
                -- { name = "buffer" },
            }),
        })
    end,
    },
}