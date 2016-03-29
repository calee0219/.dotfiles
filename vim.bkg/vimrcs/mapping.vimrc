" ~/.dotfiles/vim/vimrcs/mapping.vimrc
" This is my vimrc
"
"
"
" All mode
" mapping <leader>
let mapleader = "\<Space>"
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
" use space-w to save file
nnoremap <Leader>w :w<CR>

" Insert mode

" Select mode

" Command mode
cabbr fs w !sudo tee %
cabbr pt set paste

" Plugin

" Ultisnips
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
