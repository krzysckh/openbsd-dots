filetype plugin indent on
let mapleader = " "

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

set autowrite
set nocompatible
set backspace=indent,eol,start
set colorcolumn=80
set concealcursor=nv
set conceallevel=2
set foldenable
set foldmethod=manual
"set guifont=agave\ Nerd\ Font\ 12
set guifont=Lilex\ 10
set guiligatures=!\"#$%&()*+-./:<=>?@[]^_{\|~
set guioptions=Ac
set hidden
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set noshowmode
set number
set relativenumber
set showcmd
set showmatch
set signcolumn=yes
set smartcase
set termguicolors
set textwidth=80
set title
set ttyfast
set wildmenu

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
  Plug 'logico/typewriter-vim'
  " colorscheme
  Plug 'hotchpotch/perldoc-vim'
  " K for perl
  Plug 'junegunn/vim-easy-align'
  " align
  Plug 'vala-lang/vala.vim'
  " vala syntax
  Plug 'jaawerth/fennel.vim'
  " fennel syntax
  Plug 'janet-lang/janet.vim'
  " janet syntax
  Plug 'tpope/vim-eunuch'
  " unix helpers
  Plug 'junegunn/fzf.vim'
  " fzf
  Plug 'itchyny/lightline.vim'
  " lightline
  Plug 'tpope/vim-fugitive'
  " git
  Plug 'justinmk/vim-dirvish'
  " better netrw
  Plug 'antoyo/vim-licenses'
  " licenses
  Plug 'thinca/vim-fontzoom'
  " zoooooom
  Plug 'sheerun/vim-polyglot'
  " colors
  Plug 'vim-scripts/transpose-words'
  " transpose-words
  Plug 'sillybun/vim-repl'
  " le repl
  Plug 'tpope/vim-speeddating'
  " le dates

  Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
call plug#end()

colorscheme typewriter

xmap ga <Plug>(EasyAlign)
xmap <leader>a <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap <leader>a <Plug>(EasyAlign)

nmap > >>
nmap < <<

map <leader>lc :s/^/; /<cr>
map <leader>f =
nmap <leader>y "+y
nmap <leader>p "+p
nmap <BS> <C-^>
nmap <leader>d :e .<cr>

nmap <leader>r :REPLToggle<cr>

nmap <C-t> <Plug>Transposewords
imap <C-t> <Plug>Transposewords
cmap <C-t> <Plug>Transposewords

map <leader><leader> :call halo#run({'shape':'line'})<CR>

nmap <leader>b :Buffers<cr>

imap <C-l> λ
tnoremap <S-space> <space>

command! -range=% Topdf :hardcopy > %.ps | !ps2pdf %.ps && rm %.ps && echo "=> %.pdf"

let g:sendtorepl_invoke_key = "<leader>e"
let g:repl_console_name = '*repl*'
let g:repl_position = 3
let g:repl_input_symbols = {
      \ 'python': ['>>>', '>>>>', 'ipdb>', 'pdb', '...'],
      \ 'scheme': ['>', ''],
      \ 'racket': ['>', '']
      \ }

let g:repl_program = {
      \	'python': ['python'],
      \ 'scheme' : ['ol'],
      \ 'racket' : ['racket'],
      \	'default': ['bash']
      \	}

let g:licenses_default_commands = ['bsd2', 'bsd3', 'cc0', 'gpl', 'gplv2', 'mit',
      \ 'wtfpl']
let g:licenses_copyright_holders_name = 'krzysckh <kpm@linux.pl>'
let g:Hexokinase_highlighters = ['backgroundfull']

if has('gui_running')
  fu FChange(how)
    redir =>g:val
    Fontzoom
    redir END

    let g:val = substitute(g:val, "[^0-9]", "", "g") + a:how
    set go+=k go+=mr go-=mr go-=k

    exe 'Fontzoom ' . g:val
  endf

  nmap <C-Up> :call FChange(1)<cr>
  nmap <C-Down> :call FChange(-1)<cr>

  let g:startify_custom_header =
        \ startify#center(split(system('figlet -w 70 -f speed vim'), '\n'))
else
  let g:startify_custom_header =
        \ startify#center(split(system('figlet -w $(tput cols) -f speed vim'), '\n'))
endif

let g:startify_lists = [
      \ { 'type': 'files', 'header': ['recent'] },
      \ { 'type': 'dir', 'header': ['in '. getcwd()] }
      \ ]
highlight StartifyHeader guifg=#010101 cterm=bold

"let g:lsp_diagnostics_float_cursor = 1

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

" conceal
aug Conceal
  au!
  au FileType * syntax match Normal /\<sum\>/ conceal cchar=∑
  au FileType * syntax match Boolean /\<\#t\(rue\)\?\>/ conceal cchar=⊤
  au FileType * syntax match Boolean /\<\#f\(alse\)\?\>/ conceal cchar=⊥
aug END

let g:lightline = {
      \ 'colorscheme': 'typewriter_light',
			\ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

let g:lightline.mode_map = {
    \ 'n':      'normal',
    \ 'i':      'insert',
    \ 'R':      'replace',
    \ 'v':      'visual',
    \ 'V':      'v-line',
    \ "\<C-v>": 'v-block',
    \ 'c':      'command',
    \ 's':      'select',
    \ 'S':      's-line',
    \ "\<C-s>": 's-block',
    \ 't':      'terminal',
    \ }

augroup dirvish_config
  autocmd!
  autocmd FileType dirvish nnoremap <silent><buffer> h
        \ <Plug>(dirvish_up)
  autocmd FileType dirvish nnoremap <silent><buffer> <bs>
        \ <Plug>(dirvish_up)
augroup END

let g:terminal_ansi_colors = [
      \ '#080808', '#464646', '#626262', '#626262',
      \ '#B2B2B2', '#B2B2B2', '#868686', '#009900',
      \ '#00BAFF', '#767676', '#E41D91', '#FF00AF',
      \ '#949494', '#949494', '#eeeeee', '#ffffff' ]

highlight Terminal guibg='#eeeeee' guifg='#080808'
