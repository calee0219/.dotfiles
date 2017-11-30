"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

let g:vim_bootstrap_langs = "javascript,ruby,haskell,lisp,elixir,python,c,php,html,lua,ocaml,perl,go,erlang"
let g:vim_bootstrap_editor = "vim"				" nvim or vim

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !\curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'editorconfig/editorconfig-vim'
Plug 'rizzatti/dash.vim'

" Style
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'tomasr/molokai'
Plug 'itchyny/lightline.vim'
Plug 'gosukiwi/vim-atom-dark'

" Operate
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'

" Shell
Plug 'shougo/vimproc'
Plug 'shougo/vimshell'

" Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'c9s/gsession.vim', { 'do': 'make install'}
Plug 'sirver/ultisnips'

" Syntax
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe', { 'do': '~/.vim/plugged/YouCompleteMe/install.py --clang-completer --js-completer --go-completer' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'w0rp/ale'

" Format
Plug 'Chiel92/vim-autoformat'
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug 'godlygeek/tabular'

" Comment
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdcommenter'

" Search
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'FelikZ/ctrlp-py-matcher'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/grep.vim'

" Select
Plug 'terryma/vim-multiple-cursors'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'

" Language
Plug 'sheerun/vim-polyglot'
Plug 'xuhdev/SingleCompile'
"" Go
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
"" HTML
Plug 'mattn/emmet-vim'
"" Perl
Plug 'vim-perl/vim-perl'
Plug 'c9s/perlomni.vim'
"" Python
Plug 'davidhalter/jedi-vim'
"" Markdown
Plug 'plasticboy/vim-markdown'

call plug#end()

"*****************************************************************************
"" Basic
"*****************************************************************************
syntax on
set ruler
set number

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

" Fix backspace indent
set backspace=indent,eol,start

" Tabs
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" Map leader to ,
let mapleader=','

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Shell
if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

"*****************************************************************************
"" Config
"*****************************************************************************
" vim-commentary
autocmd FileType python,shell set commentstring=#\ %s                 " 设置Python注释字符
autocmd FileType mako set cms=##\ %s

" Session
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

" Status
set laststatus=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

" NERDTree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50

" grep.vim
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" vimshell.vim
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

" terminal emulation
if g:vim_bootstrap_editor == 'nvim'
  nnoremap <silent> <leader>sh :terminal<CR>
else
  nnoremap <silent> <leader>sh :VimShellCreate<CR>
endif

"*****************************************************************************
"" Usage
"*****************************************************************************
" indentLine
" 用 ,il 來顯現 indent line
map <leader>il :IndentLinesToggle<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Session
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" NERDTree
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>

" grep vim
nnoremap <silent> <leader>f :Rgrep<CR>

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1
let g:syntastic_python_python_exec = '/usr/bin/python3'

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" SingleCompile
nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>

" Vim-AutoFormat
noremap <F3> :Autoformat<CR>

"*****************************************************************************
"" Language
"*****************************************************************************
" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab

" python
"" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END
"" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0
"" syntastic
let g:syntastic_python_checkers=['python', 'flake8']
" vim-airline
let g:airline#extensions#virtualenv#enabled = 1
" Syntax highlight
" Default highlight is better than polyglot
let g:polyglot_disabled = ['python']
let python_highlight_all = 1

" Go
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [  'p:package', 'i:imports:1', 'c:constants', 'v:variables',
        \ 't:types',  'n:interfaces', 'w:fields', 'e:embedded', 'm:methods',
        \ 'r:constructor', 'f:functions' ],
    \ 'sro' : '.',
    \ 'kind2scope' : { 't' : 'ctype', 'n' : 'ntype' },
    \ 'scope2kind' : { 'ctype' : 't', 'ntype' : 'n' },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
" vim-go
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

augroup completion_preview_close
  autocmd!
  if v:version > 703 || v:version == 703 && has('patch598')
    autocmd CompleteDone * if !&previewwindow && &completeopt =~ 'preview' | silent! pclose | endif
  endif
augroup END

augroup go

  au!
  au Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  au Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  au Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  au Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

  au FileType go nmap <leader>r  <Plug>(go-run)
  au FileType go nmap <leader>t  <Plug>(go-test)
  au FileType go nmap <Leader>gt <Plug>(go-coverage-toggle)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)
  au FileType go nmap <C-g> :GoDecls<cr>
  au FileType go imap <C-g> <esc>:<C-u>GoDecls<cr>
  au FileType go nmap <leader>rb :<C-u>call <SID>build_go_files()<CR>

augroup END

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" vim-airline
"if !exists('g:airline_symbols')
  "let g:airline_symbols = {}
"endif

"if !exists('g:airline_powerline_fonts')
  "let g:airline#extensions#tabline#left_sep = ' '
  "let g:airline#extensions#tabline#left_alt_sep = '|'
  "let g:airline_left_sep          = '▶'
  "let g:airline_left_alt_sep      = '»'
  "let g:airline_right_sep         = '◀'
  "let g:airline_right_alt_sep     = '«'
  "let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  "let g:airline#extensions#readonly#symbol   = '⊘'
  "let g:airline#extensions#linecolumn#prefix = '¶'
  "let g:airline#extensions#paste#symbol      = 'ρ'
  "let g:airline_symbols.linenr    = '␊'
  "let g:airline_symbols.branch    = '⎇'
  "let g:airline_symbols.paste     = 'ρ'
  "let g:airline_symbols.paste     = 'Þ'
  "let g:airline_symbols.paste     = '∥'
  "let g:airline_symbols.whitespace = 'Ξ'
"else
  "let g:airline#extensions#tabline#left_sep = ''
  "let g:airline#extensions#tabline#left_alt_sep = ''

  "" powerline symbols
  "let g:airline_left_sep = ''
  "let g:airline_left_alt_sep = ''
  "let g:airline_right_sep = ''
  "let g:airline_right_alt_sep = ''
  "let g:airline_symbols.branch = ''
  "let g:airline_symbols.readonly = ''
  "let g:airline_symbols.linenr = ''
"endif

" Git
autocmd Filetype gitcommit setlocal spell textwidth=80

" YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ale_emit_conflict_warnings = 0
