" The minimal config for editing huge files
set nocompatible
filetype off

" =======VIM SETTINGS========
" Forces terminal to be in 256 mode
set t_Co=256

syntax on
set backspace=indent,eol,start

" Word wrapping
set wrap linebreak nolist
set display+=lastline
noremap gj j
noremap gk k
noremap k gk
noremap j gj
" End of WW

" Autocomplete
set wildmode=longest,list,full
set wildmenu

" Show line number
" Overridden by Solarized
set number
highlight LineNr ctermfg=245 ctermbg=235
highlight EndOfBuffer ctermfg=232

" Tab Width
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4

" If I happen to be using vimx
set clipboard=unnamedplus

" =====VIM SETTINGS END======

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ==========PLUGINS==========
" Solarized
"Plugin 'altercation/vim-colors-solarized'

" Vundle
Plugin 'VundleVim/Vundle.vim'

" NerdTree
Plugin 'scrooloose/nerdtree'

" Airline
Plugin 'bling/vim-airline'

" Airline Themes
Plugin 'vim-airline/vim-airline-themes'

" DevIcons
"Plugin 'ryanoasis/vim-devicons'

"NerdTree Syntax Highlight
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" ========PLUGINS END========
call vundle#end()
filetype plugin indent on

" =========KEY BINDS=========
" Vim
" map <c-s> :w<CR>
set pastetoggle=<F12>
" The following trick is learned from the CIA, thanks guys!
command W  w !sudo tee "%" > /dev/null

" NerdTree
map <Tab> :NERDTreeToggle<CR>
" =======KEY BINDS END=======

" ======PLUGIN SETTINGS======
" Solarized
" Warning: certain config options above are modified here
" Remember to change back to default if this option is disabled
"let g:solarized_termcolors=256
"let g:solarized_visibility = 'low'
"let g:solarized_contrast = 'high'
set background=dark
"colorscheme solarized

" DevIcon
"let g:webdevicons_enable = 1

"let g:webdevicons_enable_nerdtree = 1
"let g:webdevicons_enable_airline_tabline = 0
"let g:webdevicons_enable_airline_statusline = 0

"let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" Vim-Airline
set laststatus=2
let g:airline_theme='simple'
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
	let g:airline_symbols={}
endif

let g:airline_symbols.notexists='*' "Missing symbol in Powerline droid

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" ====PLUGIN SETTINGS END====
