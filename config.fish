# global verable
fish_vi_key_bindings
set -U fish_user_paths /usr/local/bin $HOME/.local/bin $fish_user_paths

# command
function ser
    ssh -X ssh.calee.com.tw -p 50
end

function gcp
    ssh -X calee0219@gcp.calee.com.tw
end

function kali
    ssh -X root@ssh.calee.com.tw -p 5050
end

function ccp
    #clang++ -std=c++17 -Wall -Wextra -pedantic -g3 -O2 ${*} -o ${1%.*} && time ./${1%.*}
    clang++ -std=c++1z $argv
    time ./a.out
end

function work
    ssh -X calee0219@140.110.18.200 -p 9487
end
