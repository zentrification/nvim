" --------------------------------------------------------------------------------------------------
" Table of Contents
" --------------------------------------------------------------------------------------------------
" Plugins
" Colors
" Settings
" Mappings
" --------------------------------------------------------------------------------------------------

" --------------------------------------------------------------------------------------------------
" Reading
" --------------------------------------------------------------------------------------------------
" https://github.com/lucerion/vim-as-a-ruby-ide
" https://afnan.io/2018-04-12/my-neovim-development-setup/
" https://blog.schembri.me/post/solargraph-in-vim/
" https://www.reddit.com/r/vim/comments/ajmsko/what_does_your_vimwikis_indexmd_look_like/
" --------------------------------------------------------------------------------------------------

" --------------------------------------------------------------------------------------------------
" Plugins
" --------------------------------------------------------------------------------------------------
" https://github.com/neomake/neomake
" https://github.com/universal-ctags/ctags
" https://github.com/Shougo/neosnippet.vim
" --------------------------------------------------------------------------------------------------

" https://www.reddit.com/r/neovim/comments/jfs5sb/initvim_to_initlua_any_advantages/
"lua require('config')

call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree', { 'on':  'UndotreeToggle' }
Plug 'bling/vim-airline'
Plug 'ck3g/vim-change-hash-syntax' " :ChangeHashSyntax switches to ruby 1.9 syntax
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-commentary'
Plug 'junegunn/vim-easy-align'
Plug 'dkprice/vim-easygrep'
Plug 'tpope/vim-endwise'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'mhinz/vim-startify'

Plug 'neoclide/coc.nvim', { 'tag': '*', 'do': { -> coc#util#install() } }
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_match_window = 'btop,order:ttb,min:1,max:15'

"" https://github.com/uplus/deoplete-solargraph/issues/10
"" https://github.com/tbodt/deoplete-tabnine
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"let g:deoplete#enable_at_startup = 1
"" tab to cycle autocomplete options
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
""Plug 'uplus/deoplete-solargraph'
"Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

Plug 'junegunn/vim-peekaboo'
let g:peekaboo_delay = 400
let g:peekaboo_window = 'vertical botright 70new'

" Initialize plugin system
call plug#end()

" --------------------------------------------------------------------------------------------------
" Colors
" --------------------------------------------------------------------------------------------------
colorscheme Tomorrow-Night-Bright

" --------------------------------------------------------------------------------------------------
" Settings
" --------------------------------------------------------------------------------------------------
" read :options for docs
" view with :set all or :set optionname?
" --------------------------------------------------------------------------------------------------

syntax on
filetype plugin indent on
let mapleader = ';'

set smartindent

set ignorecase
set infercase
set smartcase

set expandtab
set nosmarttab
set softtabstop=2
set shiftwidth=2
set tabstop=4

set cursorline
set ffs=unix,dos,mac
set iskeyword+=$,@,%,#,_,-
set lazyredraw
set list
set listchars=tab:▸\ ,trail:❤ " visualize tab and trailing space
set noswapfile
set nowrap
set number
set secure
set timeoutlen=500 " how long to wait for mapped sequence
set undofile
set undodir="/home/chris/.config/nvim/undodir"
set wildmode=list:longest,full

au BufRead,BufNewFile *.inky set filetype=slim

" --------------------------------------------------------------------------------------------------
" Mappings
" --------------------------------------------------------------------------------------------------
nnoremap <Leader>e :e.<CR>
nnoremap <Leader>t :tab new <CR>
nnoremap <Leader>v :source ~/.config/nvim/init.vim<CR>

" maybe use function keys more
nnoremap <F2> :set invnumber<CR>
nnoremap <Leader>p :set invpaste paste?<CR>

" center screen on searches
nnoremap n nzz
nnoremap N Nzz

" make Y consistend with C and D
nnoremap Y y$

" copyto system clipboard
vnoremap <C-c> "*y

" saving
inoremap <Leader>s <ESC>:update<CR>
nnoremap <Leader>s :update<CR>
inoremap <Leader>x <ESC>:x<CR>
nnoremap <Leader>x :x<CR>
ca w!! w !sudo tee > /dev/null "%"

" replace
nnoremap <Leader>r :%s/
vnoremap <Leader>r :s/

" themes
nnoremap \1 :colorscheme solarized<CR>
nnoremap \2 :colorscheme molokai<CR>
nnoremap \3 :colorscheme Tomorrow-Night-Bright<CR>
nnoremap \4 :colorscheme candycode<CR>
nnoremap \5 :colorscheme vividchalk<CR>
nnoremap \6 :colorscheme hybrid<CR>
nnoremap \7 :colorscheme gruvbox<CR>

" functionality
nnoremap \b  :CtrlPBuffer<CR>
"nnoremap \g  :grep -r --exclude-dir={.git,log} <c-r>=expand("<cword>")<cr> .<cr><cr>:copen<cr>
"nnoremap \G  :grep -r --exclude-dir={.git,log} <c-r>=expand("<cword>")
nnoremap \h  :help quickref<CR>
nnoremap \l  :set invnumber<CR>
nnoremap \m  :map<CR>
nnoremap \n  :NERDTreeToggle<CR>
nnoremap \nf :NERDTreeFind<CR>
nnoremap \pi :PlugInstall<CR>
nnoremap \r  :!%:p<CR>
nnoremap \t  :TagbarToggle<CR>
nnoremap \u  :UndotreeToggle<CR>

" splits
nnoremap <silent> ss <C-w>s
nnoremap <silent> vv <C-w>v
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" tabs
nnoremap <Left>  :tabprevious<CR>
nnoremap <Right> :tabnext<CR>
inoremap <Left>  <Esc>:tabprevious<CR>
inoremap <Right> <Esc>:tabnext<CR>
nnoremap <Up>    :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <Down>  :execute 'silent! tabmove ' . tabpagenr()<CR>

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
