function _aws-assume-role-cleanup
    set -l credentials_file ~/.aws/credentials
    set -l now (date -u +%s)
    set -l expired_profiles 0

    for section in (grep -oP '^\[assumed-.*?\]' $credentials_file | tr -d '[]')
        set -l time_tag (string split -m1 -r '-' $section)[-1]
        if test (string length $time_tag) -eq 15
            set -l profile_epoch (date -j -u -f "%Y%m%d-%H%M%S" $time_tag "+%s" 2>/dev/null)
            if test "$profile_epoch" -lt (math "$now - 3600")
                aws configure remove profile $section
                echo "🧹 Removed expired profile: $section"
                set expired_profiles (math $expired_profiles + 1)
            end
        end
    end

    if test $expired_profiles -eq 0
        echo "🧼 No expired assumed profiles found"
    end
end

