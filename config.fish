# Exa
if type -q exa
  alias ll "eza --long --group --icons --git"
  alias la "eza --all"
  alias lt "eza --tree --level=2"
end

# Disable Fish greeting
set fish_greeting

# Ruby 
set PATH ~/.gem/ruby/2.7.0/bin $PATH
# Set editor
set EDITOR nvim

# Golang
if [ -d $HOME/go ]; set GOPATH $HOME/go; set PATH $HOME/go/bin $PATH; end

# bin
set PATH $HOME/bin $PATH
# AWS CLI completion
test -x (which aws_completer); and complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

# User paths
set -g fish_user_paths "/usr/local/opt/icu4c/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/icu4c/sbin" $fish_user_paths
