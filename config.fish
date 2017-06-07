# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/calee0219/Downloads/google-cloud-sdk/path.fish.inc' ];
    if type source > /dev/null; source '/Users/calee0219/Downloads/google-cloud-sdk/path.fish.inc'; else; . '/Users/calee0219/Downloads/google-cloud-sdk/path.fish.inc'; end;
end

function ser
    ssh -X ssh.calee.com.tw -p 50
end

function gcp
    ssh -X sz110010@gcp.calee.com.tw
end

function kali
    ssh -X root@ssh.calee.com.tw -p 5050
end

function ccp
    #clang++ -std=c++17 -Wall -Wextra -pedantic -g3 -O2 ${*} -o ${1%.*} && time ./${1%.*}
    clang++ -std=c++1z $argv
    time ./a.out
end