#!/usr/bin/env zsh

set -e

dark_mode_status=$(/opt/homebrew/bin/dark-mode status)

last_status_file="${HOME}/.config/helix/scripts/sync-theme-with-os/macos/last.status"

if [[ -f $last_status_file ]]; then
    prev_status=$(cat $last_status_file)
else
    prev_status=$dark_mode_status
fi

echo "Dark mode was previously ${prev_status}"

if [[ "$dark_mode_status" != "$prev_status" ]]; then
    if [[ "$dark_mode_status" == "off" ]]; then
        # Update Helix Editor config to use light theme.
        sed -i '.bak' 's/theme = ".*"/theme = "rose_pine_dawn"/' ${HOME}/.config/helix/config.toml
    else
        # Update Helix Editor config to use dark theme.
        sed -i '.bak' 's/theme = ".*"/theme = "rose_pine_moon"/' ${HOME}/.config/helix/config.toml
    fi
    pkill -USR1 hx
fi

echo $dark_mode_status |> $last_status_file

