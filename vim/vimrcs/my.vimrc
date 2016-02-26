" ~/.dotfiles/vim/vimrcs/my.vimrc
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
"set expandtab
" 折疊
set foldenable
set foldmethod=syntax
set foldmethod=indent
set foldcolumn=1
"set foldlevel=1
" disable auto comment
setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"為方便複製，用<F4>開啟/關閉行號顯示:
nnoremap <F4> :set nonumber!<CR>

" 套件
" To auto run .vim/bundle
call pathogen#infect()
" 設定 NERDTree 視窗大小
let g:NERDTreeWinSize = 20
" 設定 \ + n 打開 NERDTree
map <Leader>n <plug>NERDTreeTabsToggle<CR>
" 設定滑鼠只能在 Visual, Normal mode時有作用
"set mouse=nv

abbreviate fs w !sudo tee %
abbreviate pt set paste
