#!/bin/sh

# Check if 'bat' is available
if command -v batcat >/dev/null 2>&1; then
    # for Ubuntu and Debian-based systems
    batname=$(which batcat)
elif command -v bat >/dev/null 2>&1; then
    # for all other systems
    batname=$(which bat)
else
    echo "ERROR: 'bat' command not found"
    return
fi

# Save the original system `cat` under `rcat`
alias rcat=$(which cat)

default_theme="Visual Studio Dark+"

# Add some useful aliases
alias cat="${batname} -pp --theme=\"${default_theme}\""
alias less="${batname} -p --theme=\"${default_theme}\""
alias batlog="${batname} -pp -l log"

alias bat="${batname} --theme=\"${default_theme}\""

# Add alias for '--help' and '-h'
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

export MANPAGER="sh -c 'col -bx | ${batname} -l man -p'"
