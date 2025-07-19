function on
    set -l base_dir "$HOME/Documents/personalObsidianVault/"

    # Parse first argument: note kind
    if count $argv >= 1
        set kind (string lower -- $argv[1])
    else
        set kind "tlog"
    end

    # Parse second argument: when
    if count $argv >= 2
        set raw_when (string lower -- $argv[2])
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

    # Determine paths based on note kind
    switch $kind
        case "tlog"
            set path "$base_dir/professional/tlog"
            set template "$base_dir/templates/tlog.md"
        case "daily"
            set path "$base_dir/personal/daily"
            set template "$base_dir/templates/daily.md"
        case "logbook"
            set path "$base_dir/hobby/logbook"
            set template "$base_dir/templates/logbook.md"
        case "*"
            echo "❌ Unknown note type: $kind"
            echo "Usage: on [tlog|daily|logbook] [today|yesterday|tomorrow]"
            return 1
    end

    # Ensure directory exists
    mkdir -p $path
    set file "$path/$date_str.md"

    # Create file if needed
    if not test -f $file
        if test -f $template
            cp $template $file
        else
            echo "---" > $file
            echo "tags: [$kind]" >> $file
            echo "date: $date_str" >> $file
            echo "---" >> $file
            echo "" >> $file
        end
    end

    nvim $file
end

