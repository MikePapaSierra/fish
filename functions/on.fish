function on
  if test (count $argv) -eq 0
    echo "Usage: on <note_title>"
    return 1
  end
  set title (string join '-' (date "+%Y-%m-%d") (string join '-' $argv))
  cp ~/Documents/personalObsidianVault/templates/note.md ~/Documents/personalObsidianVault/notes/$title.md
  sed -i "s/{{title}}/(string join ' ' $argv)/g; s/{{date}}/(date '+%Y-%m-%d')/g" ~/Documents/personalObsidianVault/notes/$title.md
  nvim ~/Documents/personalObsidianVault/notes/$title.md
end

