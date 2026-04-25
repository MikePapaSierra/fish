# Exa
if type -q exa
  alias ll "eza --long --group --icons --git"
  alias la "eza --all"
  alias lt "eza --tree --level=2"
end

# Go to Obsidian vault
if [ -d $HOME/Documents/personalObsidianVault ]
    alias ov "cd $HOME/Documents/personalObsidianVault"
end

# Disable Fish greeting
set fish_greeting

# Set editor
set EDITOR nvim

# Golang
if [ -d $HOME/go ]; set GOPATH $HOME/go; set PATH $HOME/go/bin $PATH; end

# AWS CLI completion
test -x (which aws_completer); and complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

# Run Starship
starship init fish | source

if not set -q GEMINI_API_KEY
  if type -q op
    set -l gemini_api_key (op read "op://Private/Gemini API Key")
    if test $status -eq 0
      set -gx GEMINI_API_KEY $gemini_api_key
    else if status is-interactive
      echo "Failed to load GEMINI_API_KEY from 1Password." >&2
    end
  end
end

set -gx PATH $HOME/.local/node_modules/.bin $PATH
