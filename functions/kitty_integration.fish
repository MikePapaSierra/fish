function kitty_integration --description "Setup Kitty integration with Fish shell and Tmux"
    if test "$TERM" = "xterm-kitty"
        # Set Fish shell integration
        if test -n "$KITTY_INSTALLATION_DIR"
            set --global KITTY_SHELL_INTEGRATION enabled
            if test -f "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
                source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
            end
        end

        # Tmux integration - ensure proper color support
        if test -z "$TMUX"
            alias tmux "tmux -2"
        end

        # Set terminal title for better tab management
        function set_title --on-variable PWD
            if test -n "$KITTY_WINDOW_ID"
                echo -ne "\033]0;$(basename $PWD)\007"
            end
        end
    end
end

# Auto-run the integration when Fish starts
kitty_integration
