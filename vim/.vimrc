filetype plugin indent on

set colorcolumn=80

let mapleader = ","

function Set_spaces()
	set expandtab
	set tabstop=2
	set softtabstop=2
	set shiftwidth=2
endfunction

function Show_spaces_put_tabs()
	" put tab, but show it as 2 spaces
	set noexpandtab
	set tabstop=2
	set softtabstop=2
	set shiftwidth=2
endfunction

syntax on

so /home/kpm/res/sus_bw.vim

set relativenumber
set number
set showcmd
set mouse=a
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set termguicolors
set title
set signcolumn=yes
set wildmenu
set backspace=indent,eol,start
set ttyfast

set noexpandtab
set tabstop=8
set softtabstop=8
set shiftwidth=8

autocmd Filetype c call Set_spaces()
autocmd Filetype cpp call Set_spaces()
autocmd Filetype go call Show_spaces_put_tabs()

au BufNewFile,BufRead *.xaml setf xml
au BufNewFile,BufRead *.axaml setf xml
au BufNewFile,BufRead *.nelua setf lua
au BufNewFile,BufRead *.y call Set_spaces()
au BufNewFile,BufRead *.c call Set_spaces()
au BufNewFile,BufRead *.cpp call Set_spaces()
au BufNewFile,BufRead *.h call Set_spaces()
au BufNewFile,BufRead *.hpp call Set_spaces()
au BufNewFile,BufRead *.go call Show_spaces_put_tabs()

let &t_SI = "\e[5 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[2 q"

" pipe for insert, block for the rest

call plug#begin('~/.vim/plugged')
	Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase'}
	" html colors
	Plug 'mhinz/vim-startify'
	" start page (,start)
	Plug 'ryanoasis/vim-devicons'
	" icons
	Plug 'preservim/nerdcommenter'
	" autocomments (,c<Space>)
	Plug 'mhinz/vim-halo'
	" where is my cursor?? (,,)
	Plug 'krzysckh/turtel-vim'
	" spotify controls in vim (,spt)
	Plug 'wakatime/vim-wakatime'
	" wakatime stats
	" discord rich presence
	Plug 'editorconfig/editorconfig-vim'
	" .editorconfig

	Plug 'prabirshrestha/async.vim', { 'for': 'go' }
	Plug 'prabirshrestha/vim-lsp', { 'for': 'go' }
	Plug 'prabirshrestha/asyncomplete.vim', { 'for': 'go' }
	Plug 'prabirshrestha/asyncomplete-lsp.vim', { 'for': 'go' }
	Plug 'mattn/vim-lsp-settings', { 'for': 'go' }
	Plug 'ajh17/vimcompletesme', { 'for': 'go' }
call plug#end()

map <leader><leader> :call halo#run({'shape':'line'})<CR>


command! -range=% Topdf :hardcopy > %.ps | !ps2pdf %.ps && rm %.ps && echo "=> %.pdf"

let g:Hexokinase_highlighters = ['backgroundfull']

let g:startify_custom_header =
			\ startify#center(split(system('figlet -w $(tput cols) -f speed vim'), '\n'))

let g:startify_lists = [
			\ { 'type': 'files', 'header': ['recent'] },
			\ { 'type': 'dir', 'header': ['in '. getcwd()] }
			\ ]
highlight StartifyHeader guifg=#dedede cterm=bold

