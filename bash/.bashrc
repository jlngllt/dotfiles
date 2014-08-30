# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ll -a'
alias grep='grep --color=auto'
alias shutdown='sudo shutdown -h now'
alias reboot='sudo reboot'


fg=('\[\e[0;30m\]' '\[\e[0;31m\]' '\[\e[0;32m\]' '\[\e[0;33m\]' '\[\e[0;34m\]' '\[\e[0;35m\]' '\[\e[0;36m\]' '\[\e[0;37m\]'
    '\[\e[1;30m\]' '\[\e[1;31m\]' '\[\e[1;32m\]' '\[\e[1;33m\]' '\[\e[1;34m\]' '\[\e[1;35m\]' '\[\e[1;36m\]' '\[\e[1;37m\]')
nofg=('\[\e[0m\]')

#PS1="${fg[5]}\u${fg[9]}@${fg[3]}\H$nofg[${fg[2]}\w$nofg]${fg[1]} »${fg[7]} "
PS1="[${fg[2]}\w$nofg]${fg[1]} »${fg[7]} "

export PROMPT_DIRTRIM=2
export EDITOR=vim

#eval $(dircolors -b $HOME/.dircolors/dircolors)

PATH=$PATH:/home/julien/bin
