set -x PYENV_ROOT $HOME/.pyenv

set -g fish_user_paths ~/.local/bin /opt/homebrew/bin $fish_user_paths

set -x EDITOR vim
set -x VISUAL "$EDITOR"

set -x LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/adriaan/miniforge3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
conda config --set auto_activate_base false
conda config --set changeps1 true

pyenv init - | source

