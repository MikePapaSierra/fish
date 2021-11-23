# Exa
if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
  alias llt "ll --tree --level=2"
  alias llta "llt -a"
end

# Fish greeting
set fish_greeting

# Ruby 
set PATH ~/.gem/ruby/2.7.0/bin $PATH

# Golang
set GOPATH $HOME/go
set PATH $HOME/go/bin $PATH

# .bin
set PATH $HOME/.bin $PATH

# User paths
set -g fish_user_paths "/usr/local/opt/icu4c/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/sbin" $fish_user_paths
