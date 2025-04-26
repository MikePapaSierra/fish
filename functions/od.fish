function od
    set date (date '+%Y-%m-%d')
    set filename "$HOME/Documents/personalObsidianVault/daily/$date.md"

    if not test -f $filename
        cp ~/Documents/personalObsidianVault/templates/daily.md $filename
        sed -i "s/{{date}}/$date/g" $filename
    end

    nvim $filename
end

