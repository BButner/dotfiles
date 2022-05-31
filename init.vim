call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'

" Auto Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

set termguicolors

let g:airline_theme='base16'
set number
set cursorline
set cursorcolumn
set encoding=utf-8

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

au BufNewFile,BufRead *.xaml setf xml
autocmd vimenter * ++nested colorscheme gruvbox
autocmd VimEnter * NERDTree

nmap <silent> gd <Plug>(coc-definition)
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> gh :noh<CR>
nmap <silent> gt :NERDTreeToggle<CR>

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>qf  <Plug>(coc-fix-current)
