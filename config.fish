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
set GOPATH ~/go
set PATH ~/go/bin $PATH
