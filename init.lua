-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")


vim.cmd([[
    colorscheme monokai-pro
    set clipboard=unnamedplus
    " for ctrl backspase
    imap <C-BS> <C-W>
    let s:fontsize = 5
    inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
]])
