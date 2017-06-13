# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/calee0219/Downloads/google-cloud-sdk/path.fish.inc' ];
    if type source > /dev/null; source '/Users/calee0219/Downloads/google-cloud-sdk/path.fish.inc'; else; . '/Users/calee0219/Downloads/google-cloud-sdk/path.fish.inc'; end;
end
set -U fish_user_paths /usr/local/bin $HOME/.local/bin $fish_user_paths

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
