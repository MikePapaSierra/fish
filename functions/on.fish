function on
    set -l base_dir "$HOME/Documents/personalObsidianVault/"

    # Parse argument: when (today|yesterday|tomorrow)
    if count $argv >= 1
        set raw_when (string lower -- $argv[1])
    else
        set raw_when "today"
    end

    # Calculate date based on time argument
    switch $raw_when
        case "yesterday"
            set date_str (date -v-1d "+%Y-%m-%d")
        case "tomorrow"
            set date_str (date -v+1d "+%Y-%m-%d")
        case "*"
            set date_str (date "+%Y-%m-%d")
    end

    # Set path for daily notes
    set path "$base_dir/daily"
    set template "$base_dir/templates/TPL_Daily.md"

    # Ensure directory exists
    mkdir -p $path
    set file "$path/$date_str.md"

    # Create file if needed
    if not test -f $file
        if test -f $template
            cp $template $file
        else
            echo "---" > $file
            echo "tags: [daily-notes]" >> $file
            echo "date: $date_str" >> $file
            echo "---" >> $file
            echo "" >> $file
            echo "# $date_str - Daily Note" >> $file
            echo "" >> $file
        end
    end

    nvim $file
end

