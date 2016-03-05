# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions




# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# COLOR
# Reset
Color_Off="\e[0m"       # Text Reset

# Regular Colors
Black="\e[0;30m"        # Black
Red="\e[0;31m"          # Red
Green="\e[0;32m"        # Green
Yellow="\e[0;33m"       # Yellow
Blue="\e[0;34m"         # Blue
Purple="\e[0;35m"       # Purple
Cyan="\e[0;36m"         # Cyan
White="\e[0;37m"        # White

# Bold
BBlack="\e[1;30m"       # Black
BRed="\e[1;31m"         # Red
BGreen="\e[1;32m"       # Green
BYellow="\e[1;33m"      # Yellow
BBlue="\e[1;34m"        # Blue
BPurple="\e[1;35m"      # Purple
BCyan="\e[1;36m"        # Cyan
BWhite="\e[1;37m"       # White

function_svn_string() {
	[ -d .svn ] || return
	`svnversion > /dev/null 2>&1`
	if [ $? -ne 0 ]; then
		echo -e "${Color_Off}(${BRed}svn error$Color_Off)"
		return
	fi
	url=`svn info 2> /dev/null | awk '/Relative URL:/ {print $3}' | cut -b 3-`
	revision=`svnversion 2> /dev/null`
	echo -e "${Color_Off}(${BRed}$url${Color_Off}:$BPurple$revision$Color_Off)"
}

if [ "$color_prompt" = yes ]; then
    #PS1="$BCyan\A \D{%m/%d} ${debian_chroot:+($debian_chroot)}$BYellow\u$BWhite@\h $BGreen[\w]$Color_Off\n> "
	PS1="$BCyan\t $BPurple\D{%m/%d} $BYellow\u$BWhite@\h $BGreen[\w] \$(function_svn_string)$Color_Off\r\n> "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -Al'
#alias l='ls -CF'
alias ptt='ssh bbsu@ptt.cc'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


#export LC_ALL="zh_TW.UTF-8"
#export LC_LANG="zh_TW.UTF-8"
#export LC_LANGUAGE="zh_TW.UTF-8"
