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
Plug 'OmniSharp/omnisharp-vim'
Plug 'SirVer/ultisnips'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot'

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'catppuccin/vim', { 'as': 'catppuccin' }

Plug '~/dracula_pro'

call plug#end()

set termguicolors

let g:airline_theme='base16'
set number
set cursorline
set cursorcolumn
set encoding=utf-8

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\'

au BufNewFile,BufRead *.xaml setf xml
autocmd VimEnter * NERDTree

colorscheme gruvbox
hi cocerrorhighlight ctermfg=red guifg=#c4384b gui=undercurl term=undercurl
hi cocwarninghighlight ctermfg=yellow guifg=#c4ab39 gui=undercurl term=undercurl

autocmd FileType xml setlocal shiftwidth=4 softtabstop=4 expandtab

inoremap <expr> <Tab> pumvisible() ? '<C-n>' :
\ getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'

" Begin COC Configuration
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

set hidden

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" End COC Configuration

" Overwrite COC for C#
autocmd FileType cs nmap <silent> gd :OmniSharpGotoDefinition<CR>
autocmd FIleType cs nmap <silent> gD :OmniSharpPreviewDefinition<CR>
autocmd FileType cs nmap <silent> gr :OmniSharpFindUsages<CR>
autocmd FileType cs nmap <silent> gi :OmniSharpFindImplementations<CR>
autocmd FileType cs nmap <silent> gI :OmniSharpPreviewImplementation<CR>
autocmd FileType cs nmap <silent> gT :OmniSharpTypeLookup<CR>
autocmd CursorHold *.cs OmniSharpTypeLookup
autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
" End Overwrite

nmap <silent> gh :noh<CR>
nmap <silent> gt :NERDTreeToggle<CR>

nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>qf  <Plug>(coc-fix-current)

let g:OmniSharp_want_snippet=1
