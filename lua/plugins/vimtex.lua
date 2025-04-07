return {
    "lervag/vimtex",
    lazy = false, -- lazy-loading will disable inverse search
    config = function()
        vim.keymap.set('n', '<leader>cc', vim.cmd.VimtexCompile)
        vim.cmd("let g:vimtex_compiler_method = 'latexmk'")
    end,
    keys = {
        { "<localLeader>cc", "", desc = "+vimtex", ft = "tex" },
    },
}