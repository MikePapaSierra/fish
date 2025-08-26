function aws-assume-role
    set -l role_arn $argv[1]
    set -l profile_name $argv[2]
    set -l duration_seconds $argv[3]

    if test -z "$role_arn" -o -z "$profile_name"
        echo "Usage: aws-assume-role <role_arn> <profile_name> [duration_seconds]"
        return 1
    end

    if test -z "$duration_seconds"
        set duration_seconds 3600
    end

    set -l timestamp (date "+%Y%m%d-%H%M%S")
    set -l session_name "assumed-$profile_name-$timestamp"

    echo "🔐 Assuming role: $role_arn"
    echo "📛 Profile name: $profile_name"
    echo "🧩 Session name: $session_name"
    echo "⏱ Duration: $duration_seconds seconds"

    set -l credentials (aws sts assume-role \
        --role-arn "$role_arn" \
        --role-session-name "$session_name" \
        --duration-seconds "$duration_seconds" \
        --output json)

    if test $status -ne 0
        echo "❌ Failed to assume role"
        return 1
    end

    set -l access_key_id (echo $credentials | jq -r '.Credentials.AccessKeyId')
    set -l secret_access_key (echo $credentials | jq -r '.Credentials.SecretAccessKey')
    set -l session_token (echo $credentials | jq -r '.Credentials.SessionToken')
    set -l expiration (echo $credentials | jq -r '.Credentials.Expiration')

    # Write to ~/.aws/credentials
    aws configure set profile.$profile_name.aws_access_key_id $access_key_id
    aws configure set profile.$profile_name.aws_secret_access_key $secret_access_key
    aws configure set profile.$profile_name.aws_session_token $session_token

    # Switch using AWS Fish plugin
    aws profile $profile_name

    echo "✅ Role assumed. Active profile: $profile_name"
    echo "📆 Session expires at: $expiration"

    _aws-assume-role-cleanup
    return 0
end

