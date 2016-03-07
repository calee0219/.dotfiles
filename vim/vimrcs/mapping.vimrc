" ~/.dotfiles/vim/vimrcs/mapping.vimrc
" This is my vimrc
"
"
"
" All mode
" mapping <leader>
let mapleader = ","
" 設定滑鼠能用
set mouse=nvi

" Vistual mode

" Normal mode
" 為方便複製，用<F4>開啟/關閉行號顯示:
nnoremap <F4> :set nonumber!<CR>
" open NERDToggle with C-n
nnoremap <C-n> :NERDTreeToggle<CR>
" for auto clean the formate
nnoremap atft ggVG=
" Open Tagbar
nnoremap <F8> :TagbarToggle<CR>

" Insert mode

" Select mode

" Command mode
cabbr fs w !sudo tee %
cabbr pt set paste
