return {
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "hrsh7th/nvim-cmp", -- ensure cmp is a dependency if you're calling require("cmp")
        },
        opts = {
        -- LuaSnip’s own config goes here if needed.
        -- e.g. history = true, updateevents = "TextChanged,TextChangedI"
            enable_autosnippets = true,
            history = true,
            delete_check_events = "TextChanged",
        },
        config = function(_, opts)
            local luasnip = require("luasnip")
            luasnip.setup(opts)
            -- Load your own snippets from the `lua/snippets` folder
            require("luasnip.loaders.from_lua").lazy_load({
                paths = { vim.fn.stdpath("config") .. "/LuaSnip" },
            })
    
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            
            local function has_words_before()
            -- Depending on your Lua version, use unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            if col == 0 then return false end
            local text = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1] or ""
            return text:sub(col, col):match("%s") == nil
            end
            
            cmp.setup({
            mapping = {
                ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    -- If the completion menu is open, select the next item
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    -- If a snippet can be expanded or jumped to, do so
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    -- If there's text before the cursor, maybe auto-complete
                    cmp.complete()
                else
                    -- Otherwise, just tab
                    fallback()
                end
                end, { "i", "s" }),
            
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
                end, { "i", "s" }),
            },
            })
        end,
    },
    -- add snippet_forward action
    {
    "L3MON4D3/LuaSnip",
    opts = function()
        LazyVim.cmp.actions.snippet_forward = function()
        if require("luasnip").jumpable(1) then
            vim.schedule(function()
            require("luasnip").jump(1)
            end)
            return true
        end
        end
        LazyVim.cmp.actions.snippet_stop = function()
        if require("luasnip").expand_or_jumpable() then -- or just jumpable(1) is fine?
            require("luasnip").unlink_current()
            return true
        end
        end
    end,
    },

    -- blink.cmp integration
    {
    "saghen/blink.cmp",
    optional = true,
    opts = {
        snippets = {
        preset = "luasnip",
        },
    },
    },
}
