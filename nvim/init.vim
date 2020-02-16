" plugins
call plug#begin()
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
"Plug 'prettier/vim-prettier', {
"  \ 'do': 'yarn install',
"  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'html'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'HerringtonDarkholme/yats.vim'

Plug 'kyoz/purify', { 'rtp': 'vim' }

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Turn backup off, since most stuff is in SVN, git et.c anyway...
 set nobackup
 set nowritebackup
 set nowb
 set noswapfile
 set history=500"

 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " INDENT SETTINGS
 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " " Use spaces instead of tabs
set expandtab

 "" Be smart when using tabs ;)
set smarttab
 
 " 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

 "" Linebreak on 500 characters
set lbr
set tw=500
 
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
	
"" COC set autocomplete entries
set pumheight=10 

hi CocErrorSign  ctermfg=Red guifg=#ef8189

hi CocWarningSign  ctermfg=Brown guifg=#e8b586
hi CocInfoSign  ctermfg=Yellow guifg=#61afef
hi CocHintSign  ctermfg=Blue guifg=#56b6c2

 augroup MyColors
    autocmd!
    autocmd ColorScheme *  highlight Normal cterm=NONE ctermbg=NONE gui=NONE guibg=NONE
                           \ | highlight LineNr ctermfg=NONE ctermbg=NONE gui=NONE guibg=NONE
                            \ | highlight FoldColumn ctermfg=NONE ctermbg=NONE gui=NONE guibg=NONE
                            \ | highlight NonText ctermfg=NONE ctermbg=NONE gui=NONE guibg=NONE
                            \ | highlight EndOfBuffer ctermfg=NONE ctermbg=NONE gui=NONE guibg=NONE
                            \ | highlight SignColumn ctermfg=NONE ctermbg=NONE gui=NONE guibg=NONE
                            \ | highlight CursorLine ctermfg=NONE ctermbg=NONE gui=NONE guibg=NONE
                            \ | highlight CursorLineNr ctermfg=NONE ctermbg=NONE gui=NONE guibg=NONE
                            \ | highlight VertSplit ctermfg=NONE ctermbg=NONE gui=NONE guibg=NONE
                            \ | highlight Directory ctermfg=NONE ctermbg=NONE gui=NONE guibg=NONE

                           
 augroup END

" Enable Syntax highlighting
syntax on
set encoding=utf8
set ffs=unix,dos,mac

"Force typescript syntax because cannot get javascript syntax to work properly
augroup SyntaxSettings
autocmd!
autocmd BufNewFile,BufRead *.jsx set syntax=typescriptreact
autocmd BufNewFile,BufRead *.js set syntax=typescriptreact
augroup END

set termguicolors
colorscheme purify

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" " Makes search act like search in modern browsers
set incsearch 

" When searching try to be smart about cases 
set smartcase

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-json', 
  \ ]
" if hidden is not set, TextEdit might fail.
set hidden 

set updatetime=300
" set filetypes as typescript.tsx
  " set filetypes as typescript.tsx
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
nmap <silent> gd <Plug>(coc-definition)

" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')
function! SynGroup()                                                            
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
"set statusline+=%{SynGroup()}
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:NERDTreeIgnore = ['^node_modules$']
"Enable vim-jsx also for .js files
let g:jsx_ext_required = 0

"" Lightline config
" Remove the default statusline
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ } 

set relativenumber
set number

"Key mappings {{{

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"


let mapleader=" "
nmap <Leader>u :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
nmap <leader>e :NERDTreeFind<CR>
nmap <Leader>f :GFiles<CR>
nmap <Leader>o :Buffers<CR>
nmap <Leader>l :Lines<CR>
nmap <Leader>q :q<CR>
nmap <Leader>s :w<CR>
nmap <Leader>p :Prettier<CR>
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

nnoremap ö %
nnoremap ä /

    "Make ctrl-l clear highlights
    nnoremap <c-l> :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>



