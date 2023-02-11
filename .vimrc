" ############ "
" Basic config "
" ############ "
" General
if !has('nvim')
    set nocompatible " Don't attempt vi compatibility (ignored in neovim, which never attempts vi compatibility)
    if &term == 'xterm-kitty'
        " vim (but not neovim) doesn't respect kitty's termcap info, so we need to fix it as follows
        let &t_ut=''
    endif
endif

" use 24-bit color if it's supported
if $COLORTERM == 'truecolor'
    set termguicolors
endif

set encoding=utf-8 " Use UTF-8 encoding  by default
set background=dark " Use bright colors to better contrast a dark background
set splitbelow " Open new view below current view
set lazyredraw " Use a more efficient approach to buffer drawing
set number " Show line numbers by default
set mouse=a " Alas, I'm not a true sysadmin yet, only a mere mortal
set splitright " open vertical splits to the right
" Searching
set showmatch " Show matching angle brackets
set incsearch " Show search matches as query is typed
set hlsearch " Keep search matches highlighted
" Indentation
set expandtab " Expand \t to spaces
set shiftwidth=4 " Define level of indentation
set tabstop=4 " Define size of a \t character
set softtabstop=4 " Backspace and tab key-presses move up to this many chars
set smartindent " Intelligently handle indented code blocks
" Folding behavior
set foldenable " Fold (hide) text blocks
set foldmethod=syntax " Define folds according to syntax definition
set foldlevelstart=8 " Decently high threshold for automatic folding
set foldnestmax=8 " Avoid too many folds in memory at once
" Save Swap files to ~/.vim/swap and backup files to ~/.vim/backup instead of the directory of the file getting edited; delete backups after successful write. Extra slash saves them to full file path, with % replacing / in the path.
set writebackup nobackup backupdir=~/.vim/backup// directory=~/.vim/swap//

" search patterns are case-insensitive if they are fully lowercase
set ignorecase smartcase

" soft wrap at characters in the breakat string instead of last character that fits
set linebreak

" more accurate syntax highlighting (at expense of performance)
autocmd BufEnter * syntax sync minlines=1024

" Keybindings
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

nnoremap ; :nohlsearch<CR>
nnoremap <space> za
" disable the bell
set belloff=all noerrorbells visualbell t_vb=
" statusline
set statusline=%0.32(%f\ %h%w%y%r%m%)%=%(%{wordcount().words}\ words,\ %L\ lines\ \ current\ location:\ %l:%c%)

" ################### "
" Vim/Neovim specific "
" ################### "
if has('nvim')
    " no line numbers in Neovim Terminal
    au TermOpen * setlocal nonumber
else
    set nocompatible " Don't attempt vi compatibility (ignored in neovim, which never attempts vi compatibility)
    if &term == 'xterm-kitty'
        " vim (but not neovim) doesn't respect kitty's termcap info, so we need to fix it as follows
        let &t_ut=''
    endif
endif

" #################### "
" Function definitions
" #################### "
function! ShortTabs()
    setlocal shiftwidth=2
    setlocal tabstop=2
    setlocal softtabstop=2
endfunction
function! NormalTabs()
    setlocal shiftwidth=4
    setlocal tabstop=4
    setlocal softtabstop=4
endfunction
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction


" ######################################## "
" vim-plug plugin manager - plugins to use "
" ######################################## "
call plug#begin('~/.vim/plugged')
" Better Tab Name management
Plug 'gcmt/taboo.vim', Cond(!exists('g:vscode'))
" Change defaults to something friendlier
Plug 'tpope/vim-sensible'
" Git integration that's 'so awesome, it should be illegal!'
Plug 'tpope/vim-fugitive', Cond(!exists('g:vscode'))
"Underline all occurrences of the current word
Plug 'itchyny/vim-cursorword', Cond(!exists('g:vscode'))
" Sidebar with overview of file contents - requires exuberant ctags, external to Vim
Plug 'preservim/tagbar', Cond(!exists('g:vscode'))
" NERDTree - file sidebar
Plug 'preservim/nerdtree', Cond(!exists('g:vscode'))
Plug 'Xuyuanp/nerdtree-git-plugin', Cond(!exists('g:vscode'))
Plug 'ryanoasis/vim-devicons', Cond(!exists('g:vscode'))
Plug 'johnstef99/vim-nerdtree-syntax-highlight', Cond(!exists('g:vscode'))
" Support EditorConfig system
Plug 'editorconfig/editorconfig-vim'
" See git changes right beside line numbers
Plug 'airblade/vim-gitgutter', Cond(!exists('g:vscode'))
" More efficient automatic folds
Plug 'Konfekt/FastFold', Cond(!exists('g:vscode'))
" multi-line selection done easy
Plug 'mg979/vim-visual-multi', Cond(!exists('g:vscode'))
" VSCode Dark + look for n?vim
Plug 'tomasiser/vim-code-dark', Cond(!exists('g:vscode'))
" add multi-line comment toggling
Plug 'tpope/vim-commentary', Cond(!exists('g:vscode'))
" Text alignment tool - needed for some vim-markdown functionality, even if I
" don't use it myself
Plug 'godlygeek/tabular', Cond(!exists('g:vscode'))
" #################################### "
" Improved/Additional Language Support "
" #################################### "
" Jupyter (via jupytext)
Plug 'goerz/jupytext.vim', Cond(!exists('g:vscode'))
" automatic markdown table of contents
Plug 'mzlogin/vim-markdown-toc'
" Hjson
Plug 'hjson/vim-hjson', Cond(!exists('g:vscode'))
" Better than native markdown support
Plug 'plasticboy/vim-markdown', Cond(!exists('g:vscode'),{'for': 'markdown'})
" Support for Tom's Obvious Minimal Language
Plug 'cespare/vim-toml', Cond(!exists('g:vscode'))
" nginx configuration syntax support
Plug 'vim-scripts/nginx.vim', Cond(!exists('g:vscode'))
" syntax support for the assembly-like programming language from the game mindustry
Plug 'purofle/vim-mindustry-logic', Cond(!exists('g:vscode'))
" Indent according to python's PEP-8 style standard
Plug 'Vimjas/vim-python-pep8-indent', Cond(!exists('g:vscode'), {'for': 'python'})
" Add a built-in Autopep8 tool
Plug 'tell-k/vim-autopep8', Cond(!exists('g:vscode'), {'for': 'python'})
" Better than native python syntax highlighting
Plug 'vim-python/python-syntax', Cond(!exists('g:vscode'), {'for': 'python'})
" javascript syntax + improved indentation
Plug 'pangloss/vim-javascript', Cond(!exists('g:vscode'))
" support for the Caddy web server's Caddyfile configuration
Plug 'isobit/vim-caddyfile', Cond(!exists('g:vscode'))
" better folding for python
Plug 'tmhedberg/SimpylFold', Cond(!exists('g:vscode'), {'for': 'python'})
" Cisco IOS
Plug 'CyCoreSystems/vim-cisco-ios', Cond(!exists('g:vscode'))
" Official Rust Vim Plugin
Plug 'rust-lang/rust.vim', Cond(!exists('g:vscode'), {'for': 'rust'})
" Syntax highlighting for kitty terminal config file
Plug 'fladson/vim-kitty', Cond(!exists('g:vscode'))
" Syntax highlighting for xonsh
Plug 'abhishekmukherg/xonsh-vim', Cond(!exists('g:vscode'))
" Syntax highlighting for ion
Plug 'vmchale/ion-vim', Cond(!exists('g:vscode'))
" Syntax highlighting for fish
Plug 'khaveesh/vim-fish-syntax', Cond(!exists('g:vscode'))
" Syntax highlighting for Nix
Plug 'LnL7/vim-nix', Cond(!exists('g:vscode'))
" Syntax highlighting for scarpet, the scripting language from Minecraft's carpet mod
Plug 'twh2898/vim-scarpet', Cond(!exists('g:vscode'))
" Syntax highlighting for OpenWRT UCI files
Plug 'cmcaine/vim-uci', Cond(!exists('g:vscode'))
" Syntax highlighting for RC Shell
Plug 'weakish/rcshell.vim', Cond(!exists('g:vscode'))
" Syntax highlighting for Elfish
Plug 'dmix/elvish.vim', { 'on_ft': ['elvish']}
call plug#end()

" ###################### "
" Filetype configuration "
" ###################### "
" Use filetype-specific indentation settings
filetype indent on
" call ShortTabs() for specific file types
autocmd FileType markdown call ShortTabs()
autocmd FileType yaml call ShortTabs()
autocmd FileType cisco call ShortTabs()

" ############################## "
" Plugin-specific configurations "
" ############################## "
" jupytext.vim
let g:jupytext_to_ipynb_opts = '--update --set-kernel python3 --to=ipynb --update-metadata ''{"jupytext":{"notebook_metadata_filter":"-all"},"cell_metadata_filter": "-all"}'''

" vim-markdown
let g:vim_markdown_strikethrouh = 1
let g:vim_markdown_no_extensions_in_markdown = 0
let g:vim_markdown_autowrite = 1

" NERDTree
"   launch if vim opens a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" use vim-code-dark unless in the linux vconsole or vscode-like environment
if &term =~ 'linux' || exists('g:vscode')
    colorscheme default
else
    colorscheme codedark
endif
