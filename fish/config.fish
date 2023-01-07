set fish_greeting ""

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

if type -q exa
  alias ls "exa -g"
else
  alias ls "ls -p -G"
end

# aliases
alias la "ls -a"
alias ll "ls -l"
alias lla "ll -a"
alias g git
command -qv nvim && alias vim nvim

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# lua-language-server
set -gx PATH /home/julien/ghq/github.com/sumneko/lua-language-server/bin $PATH

# yarn global
set -gx PATH $(yarn global bin) $PATH
