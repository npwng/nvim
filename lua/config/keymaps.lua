-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.g.mapleader = " "


local ls = require("luasnip")
vim.keymap.set({ "i", "s" }, "<C-k>", function()
if ls.choice_active() then
    ls.change_choice(1)
end
end)
vim.keymap.set({ "i", "s" }, "<C-j>", function()
if ls.choice_active() then
    ls.change_choice(-1)
    end
end)