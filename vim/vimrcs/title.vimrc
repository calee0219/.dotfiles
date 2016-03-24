" ~/.dotfiles/vim/vimrcs/tital.vimrc



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件標題
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 新建.c,.h,.sh,.java文件，自動插入文件頭
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
"" 定義函數SetTitle，自動插入文件頭
func SetTitle()
    " .sh
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")
    " .python
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "")
    " .ruby
    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")
"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
    "  other filetype's title
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "	> File Name: ".expand("%"))
        call append(line(".")+1, "	> Author: Gavin Lee")
        call append(line(".")+2, "	> School: National Chiao Tung University")
        call append(line(".")+3, "	> Team: NCTU_Ragnorok")
        call append(line(".")+4, "	> Mail: sz110010@gmail.com")
        call append(line(".")+5, "	> Created Time: ".strftime("%c"))
        call append(line(".")+6, " ************************************************************************/")
        call append(line(".")+7, "")
    endif
    " .cpp
    if expand("%:e") == 'cpp'
        call append(line(".")+8, "#include <bits/stdc++.h>")
        call append(line(".")+9, "using namespace std;")
        call append(line(".")+10, "")
    endif
    " .c
    if &filetype == 'c'
        call append(line(".")+8, "#include <stdio.h>")
        call append(line(".")+9, "#include <stdlib.h>")
        call append(line(".")+10, "#include <string.h>")
        call append(line(".")+11, "#include <stdbool.h>")
        call append(line(".")+12, "#include <math.h>")
        call append(line(".")+13, "#include <time.h>")
        call append(line(".")+14, "")
        call append(line(".")+15, "/* Colors */")
        call append(line(".")+16, "#define KNRM\t\"\\x1B\[0m\"")
        call append(line(".")+17, "#define KRED\t\"\\x1B\[31m\"")
        call append(line(".")+18, "#define KGRN\t\"\\x1B\[32m\"")
        call append(line(".")+19, "#define KYEL\t\"\\x1B\[33m\"")
        call append(line(".")+20, "#define KBLU\t\"\\x1B\[34m\"")
        call append(line(".")+21, "#define KMAG\t\"\\x1B\[35m\"")
        call append(line(".")+22, "#define KCYN\t\"\\x1B\[36m\"")
        call append(line(".")+23, "#define KWHT\t\"\\x1B\[37m\"")
        call append(line(".")+24, "#define RESET\t\"\\033\[0m\"")
        call append(line(".")+25, "/* other */")
        call append(line(".")+26, "#define MAX(x,y) ((x>y)?x:y)")
        call append(line(".")+27, "")
    endif
    " .h
    if expand("%:e") == 'h'
        call append(line(".")+8, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+9, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+10, "#endif")
    endif
    " .java
    if &filetype == 'java'
        call append(line(".")+8,"public class ".expand("%:r"))
        call append(line(".")+9,"")
    endif
    " 新建文件後，自動定位到文件末尾
endfunc
autocmd BufNewFile * normal G
