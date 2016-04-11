language messages C
call plug#begin('~/.config/nvim/plugged')
Plug 'indiofish/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'benekastah/neomake', {'on': []}
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'garbas/vim-snipmate',{ 'on': []} | Plug 'indiofish/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/Goyo.vim'
Plug 'vim-scripts/indentpython.vim', {'for': 'python'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'Shougo/deoplete.nvim' | Plug 'Shougo/neoinclude.vim'
        \ | Plug 'Shougo/neco-syntax'
Plug 'jvoorhis/coq.vim', {'for': 'coq'}
Plug 'the-lambda-church/coquille', {'for': 'coq'} | Plug 'def-lkb/vimbufsync'
Plug 'tomasr/molokai'
"dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
call plug#end()

"BASIC SETTINGS
"syntax on
set fileencodings=UTF-8
set noswapfile
set shortmess=aoc
set ignorecase
set smartcase
set infercase
set autowrite
set showmode
set nomodeline
set expandtab
set mouse=n
set mousehide
set hidden "keeps buffer
set viminfo=:20,'20,@0,<0,/0

set splitright "when opening splits, they go right
set splitbelow "and below
set autochdir
set smartindent
set clipboard=unnamed	"yank to the system register (+) by default
set tabstop=2
set shiftwidth=2
set softtabstop=2
set scrolloff=1
set showcmd
set number
set rnu "relative number lines
set wrap
set ttimeoutlen=40
set autowrite
set textwidth=79

set pumheight=5 "height of ins-completion-menu
set foldmethod=manual
set complete=.,b,i
set completeopt+=longest,menuone
set completeopt-=preview
set completeopt+=noinsert

set wildignorecase
set wildmode=longest:full,full
set wildignore=*.o,*~,*.pyc,*.class,*.zip,*.out
"set tags=./tags
"set tags+=~/school/2016-1/os/os-team8/linux-3.10-sc7730/tags
"cs add ~/school/2016-1/os/os-team8/linux-3.10-sc7730/cscope.out
let loaded_matchparen = 1
let loaded_netrwPlugin = 1
let &titleold = getcwd()

"COLOR CONFIGURATION
augroup load_colors
  au!
  au ColorScheme * set background=dark
  "au ColorScheme * hi Normal ctermbg=234
  au ColorScheme * hi Normal ctermbg=None
  au ColorScheme * hi NonText ctermfg=234 ctermbg = None
  "au ColorScheme * hi Normal ctermfg = 254
  au ColorScheme * hi CursorLineNr ctermfg=117 cterm=bold 
  au ColorScheme * hi LineNr ctermfg=250 ctermbg=none
  au ColorScheme * hi Pmenu ctermfg=250 ctermbg=240
  au ColorScheme * hi PmenuSel ctermfg=11 ctermbg=25
  au ColorScheme * hi WildMenu ctermbg=238
  au ColorScheme * hi StatusLine ctermbg=238 ctermfg=253 cterm=bold
  "au ColorScheme * hi StatusLineNC ctermfg=244 ctermbg=232
augroup END
color molokai

let python_highlight_space_errors=0
let python_highlight_all=1
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

"STATUSLINE CONFIGURATION
set statusline=\[%<%F\] "file path
set statusline+=%(\ [%M%R%H]%)
set statusline+=%=\ %04l/%04L      "flags and LineNum

"KEYMAPS

"map space to a leader key.
map <Space> <leader>
"easier saving & quitting
nmap <silent><leader>w :w!<cr>
nmap <silent><leader>q :q<cr>
"Toggle paste mode on and off
map <silent><leader>pp :setlocal paste!<cr>
noremap <leader>l :ls<CR>:b
noremap <leader>gc :Gcommit -m ""<left>
noremap <leader>gw :Gwrite<CR>
noremap <leader>gp :Gpush<CR>

"copy the whole file to clipboard
nnoremap <leader>cp :%y+<cr>:echo "Copied to clipboard"<cr>
"change word under cursor (substitute)
nnoremap <leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
"tab to leave insert mode and save my pinky
imap jj <esc>
"search word and focus it at center
map N Nzz
map n nzz
map * *zz
"H to home, L to end
map H ^
map L $
"make Y act like D or C; from the cursor to the EOL
map Y y$
"indenting maintains visual area 
vnoremap > >gv
vnoremap < <gv
tnoremap <Esc> <C-\><C-n>

"move through splits easily
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"keymap regarding tabs
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabprev<CR>
nnoremap tk  :tabnext<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
nnoremap [l  :lprev<CR>
nnoremap ]l  :lnext<CR>

nnoremap <silent>bn :bnext<CR>
nnoremap <silent>bp :bprev<CR>

"press esc to disable highlight
nnoremap <silent><esc> :noh<esc>
"search visually selected area
"sudo write a file :W
command! W w term sudo tee % > /dev/null

"PLUGIN CONFIGURATION

"NERDComment configuration
let NERDCreateDefaultMappings=0
"this lets you keep visual selection
nmap <leader>cc <plug>NERDCommenterToggle
nmap <leader>cu <plug>NERDCommenterUncomment
vmap <leader>cc <plug>NERDCommenterTogglegv
vmap <leader>cu <plug>NERDCommenterUncommentgv

"AUTOPairs configuration
let g:AutoPairsMultilineClose = 0
let g:AutoPairsFlyMode = 0
au BufEnter *.rkt let b:AutoPairs 
      \ = {"(": ")","{": "}", '"': '"', "[": "]"}

"syntastic configuration
highlight SyntasticErrorSign ctermfg=0 ctermbg=168

"NERDTree configuration
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeWinSize=20

"deoplete configuration
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 3
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.python = '[^. *\t]\.\w*'
let g:deoplete#omni#input_patterns.java = '[^. *\t]\.\w*'
inoremap <silent><expr><Tab> snipMate#CanBeTriggered()? 
      \ "\<C-R>=snipMate#TriggerSnippet()\<CR>" :
      \ pumvisible() ? "\<C-y>" : "\<TAB>"


"Neomake configuration
let g:neomake_python_enabled_makers = ['flake8']
let g:neomake_java_javac_maker = {
  \'args': ['-Xlint'],
  \}
autocmd BufWritePost * Neomake
augroup neomake
augroup END

"GOYO jump to last cursor position upon exit.
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"Tagbar configuration
nmap <leader>t :TagbarToggle<cr>
let g:tagbar_width =20
let g:tagbar_show_visibility = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
let g:tagbar_map_showproto = "p"

"AUTOCMDS

augroup coq
  au!
  au BufEnter,BufNewFile *.v CoqLaunch
  au BufEnter,BufNewFile *.v map <leader>q :qa<cr>
augroup END
augroup format
  au!
  au FileType * set formatoptions-=o
augroup END

augroup movecursor
  au!
  autocmd BufWinEnter * 
        \ if line("'\"") > 0 && line("'\"") <= line("$") | 
        \   exe "normal g`\"" |
        \ endif 

augroup END

augroup tmux
  au!
  autocmd BufEnter * call system("tmux rename-window ". expand("%:t"))
  autocmd VimLeavePre * call system("tmux setw automatic-rename")
augroup END

augroup lazyload_plugins
  au!
    au InsertEnter * call plug#load('vim-snipmate')
    au BufWritePre * call plug#load('neomake')
augroup END

nmap <silent><space>r :10sp<CR>:Run<CR>
au BufEnter *.v nmap <silent><space>r :Run<CR>
nmap <f5> :Run<CR>
augroup Run
  au!
  au Bufenter *.py command! Run te python3 %

  au Bufenter *.c command! Run te gcc % -lm && ./a.out
  au Bufenter *.c set makeprg=gcc\ %\ -lm

  au Bufenter *.cpp command! Run term g++ % && ./a.out

  au Bufenter *.java command! Run term javac % && java %:r

  au Bufenter *.rkt command! Run term racket %
  au Bufenter *.ml command! Run term ocamlbuild -quiet %:r.native --
  au Bufenter *.v command! Run CoqToCursor
augroup END

"FUNCTIONS

"function for displaying current directory the way i like it
function! MyDir()
  " empty flag lets you swap only once
  " parse home directory and the usr name and substitute to ~/
  let cwd = substitute(getcwd(),'/home/\h\w*',"~","")
  return cwd . "/"
endfunction

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd User GoyoEnter call <SID>goyo_enter()
autocmd User GoyoLeave call <SID>goyo_leave()
