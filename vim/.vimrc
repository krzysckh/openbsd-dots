filetype plugin indent on

set colorcolumn=80
set textwidth=80

let mapleader = ","

function Set_spaces()
  set expandtab
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
endfunction

function Set_tabs()
  set noexpandtab
  set tabstop=8
  set softtabstop=8
  set shiftwidth=8
endfunction

function Show_spaces_put_tabs()
  " put tab, but show it as 2 spaces
  set noexpandtab
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
endfunction

syntax on

"so /home/kpm/res/sus_bw.vim

set relativenumber
set number
set showcmd
set mouse=a
set showmatch
set ignorecase
set smartcase
set incsearch
set autowrite
set hidden
set termguicolors
set title
set signcolumn=yes
set wildmenu
set backspace=indent,eol,start
set ttyfast

set foldenable
set foldmethod=manual

runtime! ftplugin/man.vim

call Set_spaces()

au BufNewFile,BufRead *.xaml setf xml
au BufNewFile,BufRead *.axaml setf xml
au BufNewFile,BufRead *.nelua setf lua
au BufNewFile,BufRead *.go call Show_spaces_put_tabs()
au Filetype go call Show_spaces_put_tabs()
au Filetype make call Set_tabs()

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
  Plug 'wakatime/vim-wakatime'
  " wakatime stats
  Plug 'editorconfig/editorconfig-vim'
  " .editorconfig
  Plug 'dracula/vim', { 'as': 'dracula' }
  " colorscheme
  Plug 'hotchpotch/perldoc-vim'
  " K for perl
  Plug 'junegunn/vim-easy-align'
  " align
  Plug 'jaawerth/fennel.vim'
  " fennel syntax
  Plug 'hylang/vim-hy'
  " hy syntax
  Plug 'tpope/vim-eunuch'
  " unix helpers

  "Plug 'prabirshrestha/async.vim', { 'for': ['go', 'java', 'javascript', 'php', 'c', 'perl'] }
  "Plug 'prabirshrestha/vim-lsp', { 'for': ['go', 'java', 'javascript', 'php', 'c', 'perl']}
  "Plug 'prabirshrestha/asyncomplete.vim', { 'for': ['go', 'java', 'javascript', 'php', 'c', 'perl'] }
  "Plug 'prabirshrestha/asyncomplete-lsp.vim', { 'for': ['go', 'java', 'javascript', 'php', 'c', 'perl'] }
  "Plug 'mattn/vim-lsp-settings', { 'for': ['go', 'java', 'javascript', 'php', 'c', 'perl'] }
  "Plug 'ajh17/vimcompletesme', { 'for': ['go', 'java', 'javascript', 'php', 'c', 'perl'] }
  Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
call plug#end()

colorscheme dracula

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
xmap <leader>a <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)

map <leader><leader> :call halo#run({'shape':'line'})<CR>

imap <C-l> λ

command! -range=% Topdf :hardcopy > %.ps | !ps2pdf %.ps && rm %.ps && echo "=> %.pdf"

let g:hy_enable_conceal = 1
let g:Hexokinase_highlighters = ['backgroundfull']

let g:startify_custom_header =
      \ startify#center(split(system('figlet -w $(tput cols) -f speed vim'), '\n'))

let g:startify_lists = [
      \ { 'type': 'files', 'header': ['recent'] },
      \ { 'type': 'dir', 'header': ['in '. getcwd()] }
      \ ]
highlight StartifyHeader guifg=#dedede cterm=bold

"let g:lsp_diagnostics_float_cursor = 1

set signcolumn=yes
let g:vcm_tab_complete = 'user'
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" coc tab autocompletion
inoremap <silent><expr> <Tab>
  \ coc#pum#visible() ? coc#pum#next(1) :
  \ CheckBackspace() ? "\<Tab>" :
  \ coc#refresh()


" highlight redundant whitespace
highlight RedundantWhitespace ctermbg=red guibg=#ff5555
match RedundantWhitespace /\s\+$/

" don't highlight whitespace on Startify
autocmd User StartifyReady match RedundantWhitespace //
autocmd User StartifyBufferOpened match RedundantWhitespace /\s\+$/
