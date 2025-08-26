function app
    # Extract profiles from both config and credentials files
    set -l profiles ( \
        grep -h '^\[profile ' ~/.aws/config 2>/dev/null | sed -E 's/\[profile (.+)\]/\1/' ; \
        grep -h '^\[' ~/.aws/credentials 2>/dev/null | sed -E 's/\[(.+)\]/\1/' \
    | sort -u)

    if test -z "$profiles"
        echo "No AWS profiles found"
        return 1
    end

    # Let user pick a profile via fzf
    set -l selected (printf "%s\n" $profiles | fzf --prompt="🔍 Select AWS profile: " --height=20 --reverse --border)

    if test -z "$selected"
        echo "❌ No profile selected"
        return 1
    end

    # Set the profile using aws_profile (Fish plugin)
    aws profile $selected
    echo "✅ Switched to profile: $selected"
end

