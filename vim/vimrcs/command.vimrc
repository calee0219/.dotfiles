"為方便複製，用<F4>開啟/關閉行號顯示:
nnoremap <F4> :set nonumber!<CR>

" 設定 \ + n 打開 NERDTree
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" 設定滑鼠只能在 Visual, Normal mode時有作用
"set mouse=nv

abbreviate fs w !sudo tee %
abbreviate pt set paste
