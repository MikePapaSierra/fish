function ot
    set args $argv
    set tasks_file \"$HOME/Documents/personalObsidianVault/tasks.md\"

    if not test -f $tasks_file
        touch $tasks_file
    end

    if test (count $args) -eq 2 -a $args[1] = '--list'
        set area (string replace -r '^(\\w)' '\u$1' -- $args[2])
        set in_section 0
        for line in (cat $tasks_file)
            if string match -q "## $area" $line
                set in_section 1
                echo "📋 $area:"
                continue
            end
            if string match -qr '^## ' $line
                set in_section 0
            end
            if test $in_section -eq 1
                echo $line
            end
        end
        return
    end

    set complete_existing 0
    set done 0

    for i in (seq (count $args))
        if string match -iq -- '--complete' $args[$i]
            set complete_existing 1
            set args[$i] ''
        else if string match -iq -- '--done' $args[$i]
            set done 1
            set args[$i] ''
        end
    end

    set clean_args (string join ' ' $args | string trim)
    set clean_args (string split -- ' ' $clean_args)

    if test (count $clean_args) -lt 2
        echo "Usage:"
        echo "  ot <area> [--done] \"<task>\"       # Add new task"
        echo "  ot <area> --complete \"<task>\"     # Mark existing task as done"
        echo "  ot --list <area>                    # List tasks in area"
        return 1
    end

    set area (string replace -r '^(\\w)' '\u$1' -- $clean_args[1])
    set task (string join ' ' $clean_args[2..-1])

    set lines (cat $tasks_file)
    set tmp_file (mktemp)
    set in_section 0
    set task_found 0
    set section_found 0

    for line in $lines
        if string match -q "## $area" $line
            set in_section 1
            set section_found 1
        else if string match -qr '^## ' $line
            set in_section 0
        end

        if test $in_section -eq 1
            if string match -q "*$task*" $line
                set task_found 1
                if test $complete_existing -eq 1
                    set line (string replace -r '^\\- \\[.\\]' '- [x]' -- $line)
                    echo $line >> $tmp_file
                    continue
                end
            end
        end

        echo $line >> $tmp_file
    end

    if test $complete_existing -eq 1
        if test $task_found -eq 0
            echo "❌ Task not found in '$area': $task"
        else
            echo "✅ Marked task as completed in '$area'"
            mv $tmp_file $tasks_file
        end
        return
    end

    if test $section_found -eq 0
        echo "" >> $tmp_file
        echo "## $area" >> $tmp_file
        echo "- [{$done = 1 ? 'x' : ' '}] $task" >> $tmp_file
        echo "✅ Created new section and added task to '$area'"
    else if test $task_found -eq 0
        echo "- [{$done = 1 ? 'x' : ' '}] $task" >> $tmp_file
        echo "✅ Added task to existing '$area' section"
    else
        echo "⚠️ Task already exists in '$area'"
    end

    mv $tmp_file $tasks_file
end

