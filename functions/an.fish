function an --description "Open (or create) today's AI agent session note under second-brain/agents/sessions"
    set -l base_dir "$HOME/second-brain/agents"
    set -l path "$base_dir/sessions"
    set -l date_str (date "+%Y-%m-%d")

    mkdir -p $path
    set -l file "$path/$date_str.md"

    if not test -f $file
        echo "# $date_str - Agent Session Notes" > $file
        echo "" >> $file
    end

    nvim $file
end
