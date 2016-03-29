" ~/.dotfiles/vim/vimrcs/display.vimrc
" This is my vimrc
"
"
"
" 檔案編碼
set encoding=utf-8
set fileencodings=utf-8,cp950

"  Set line numbers
set number
" 設定目前行底線提示
set cursorline
" 高亮當前列 (垂直)
set cursorcolumn
" 顯示右下角詳細資訊
set ruler
" 顯示相對行號。
"set relativenumber
" 字數過長時換行。
set wrap
"set nowrap     " 不換行

"  Color
" Set syntax color
syntax on
" 擴充語法上色
"colorscheme kolor
colorscheme monokai
" Change background style
set background=dark " dark or light
" Change background and frontground color
"highlight Normal ctermfg=black ctermbg=white
" 在關鍵字還沒完全輸入完畢前就顯示結果
set incsearch

"  Set tab
" Set auto tab
" Copy the form of last line
set autoindent
" Specially work in C-like files
set cindent
set smartindent
" How long does tab truely is
set tabstop=4
" How long will backspace delet a space
set softtabstop=4
" How long when press tab
set shiftwidth=4
" Change tap to space
set expandtab
" 折疊
set foldenable
set foldmethod=syntax
set foldmethod=indent
set foldcolumn=1
"set foldlevel=1
" disable auto comment
setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" 套件

" NERDTree
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" change NERDTree default arrows
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
" 設定 NERDTree 視窗大小
let g:NERDTreeWinSize = 25
" set NERDTree bar on the right
"let NERDTreeWinPos="right"
" display bookmark
let NERDTreeShowBookmarks=1

" vim-airline
" display it
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme="luna"
let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:ycm_show_diagnostics_ui = 0

" tagbar
" set tagbar's width
let g:tagbar_width = 25
