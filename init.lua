-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")


vim.cmd([[
    setlocal spell spelllang=en_us
    let loaded_spellfile_plugin = 1
    inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
    set spell

    colorscheme monokai-pro
    set clipboard=unnamedplus
    " for ctrl backspase
    imap <C-BS> <C-W>
]])
