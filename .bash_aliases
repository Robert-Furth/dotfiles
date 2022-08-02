alias sl=ls
alias ll='ls -l'
alias la='ls -Al'

# `clear` also clears tmux scrollback buffer
if [[ $TMUX ]]; then
    alias clear='clear && tmux clear-history'
fi

# git aliases
alias ggrep='git grep'
alias ggr='git grep'
alias gst='git status'
alias gch='git checkout'
alias ga='git add'
alias gap='git add --patch'
alias gc='git commit'
alias gcm='git commit -m'

# Activate venv in ~/venvs
activate() {
    if [[ ! -f "$HOME/venvs/$1/bin/activate" ]]; then
        echo "'~/venvs/$1/bin/activate' does not exist" >&2
        return 1
    fi

    source "$HOME/venvs/$1/bin/activate"
}

# Shell completions for activate
_activate() {
    COMPREPLY=()
    for dir in $(ls -1 ~/venvs); do
        if [[ "$dir" == "$2"* ]]; then
            COMPREPLY+=("$dir")
        fi
    done
}
complete -F _activate activate
