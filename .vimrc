" NeoBundle
let s:bundle_dir = expand('$HOME/.vim/bundle')
let s:neobundle_dir = s:bundle_dir . '/neobundle.vim'
let s:neobundle_repo = 'https://github.com/Shougo/neobundle.vim'
let g:neobundle#cache_file = expand('$HOME/.vim/neobundlecache')
let &runtimepath.=','.s:neobundle_dir
try
	call neobundle#begin(s:bundle_dir)
catch /E117/ " neobundle not installed
	execute "!mkdir -p " .  s:neobundle_dir
	execute "!" . "git clone " s:neobundle_repo . " " . s:neobundle_dir
	call neobundle#begin(s:bundle_dir)
	NeoBundleInstall
	call neobundle#end()
	quit
endtry



" Bundles
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'sgur/ctrlp-extensions.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'ivyl/vim-bling'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'SirVer/ultisnips'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

if neobundle#tap('bling.vim')
    nnoremap <silent> n nzz:call BlingHighight()<CR>
    nnoremap <silent> N Nzz:call BlingHighight()<CR>
    nnoremap <silent> * *zz:call BlingHighight()<CR>
    nnoremap <silent> # #zz:call BlingHighight()<CR>
    if !g:bling_no_expr
      cnoremap <silent> <expr> <enter> BlingExpressionHighlight()
    endif
    call neobundle#untap()
endif


" Colors
let g:base16_shell_path=$HOME . '/bin/base16-shell'
set t_Co=256
let base16colorspace=256
set background=dark
colorscheme base16-default
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

" Syntax Highlighting
syntax on
set number

filetype plugin on
set omnifunc=syntaxcomplete#Complete
set encoding=utf-8
set pastetoggle=<F2>

set mouse=a
set bs=2

let mapleader = ","
nmap s <Plug>(easymotion-sl)
nmap S <Plug>(easymotion-s)

" Remove last highlights
highlight Cursor guifg=green guibg=red
nnoremap <c-n> :nohl<CR>

" Use Spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable tmp files
set nobackup
set nowritebackup

" ctrlp settings
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" disable folding
set nofoldenable

" Change cursor depening on mode
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;red\x7"
  silent !echo -ne "\033]12;red\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif

if &term =~ '^xterm'
  " solid underscore
  let &t_SI .= "\<Esc>[4 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif

" Ultisnip config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
