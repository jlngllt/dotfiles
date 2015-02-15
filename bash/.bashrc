#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

distro=$(uname -s)

# Alias
if [ $distro = 'Darwin' ]
then
  alias ls='ls -G'
  alias grep='grep --colour'
else
  alias grep='grep --color=auto'
  alias ls='ls --color=auto'
fi
alias ll='ls -lh'
alias la='ll -a'
alias tmux='tmux -2'
alias shutdown='sudo shutdown -h now'
alias reboot='sudo reboot'

# Prompt
fg=('\[\e[0;30m\]' '\[\e[0;31m\]' '\[\e[0;32m\]' '\[\e[0;33m\]'
    '\[\e[0;34m\]' '\[\e[0;35m\]' '\[\e[0;36m\]' '\[\e[0;37m\]'
    '\[\e[1;30m\]' '\[\e[1;31m\]' '\[\e[1;32m\]' '\[\e[1;33m\]'
    '\[\e[1;34m\]' '\[\e[1;35m\]' '\[\e[1;36m\]' '\[\e[1;37m\]')
nofg=('\[\e[0m\]')
PS1="[${fg[3]}\w$nofg]${fg[5]} $ ${nofg}"

export PROMPT_DIRTRIM=2
export EDITOR=vim

if [ $distro = 'Darwin' ]
then
  # Patch pour ouvrir android studio dans mac
  export STUDIO_JDK=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk
fi

PATH=$PATH:$HOME/bin
