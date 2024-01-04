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

# Add some useful aliases
alias cat="${batname} -pp --theme=\"Visual Studio Dark+\""
alias less="${batname} -p --theme=\"Visual Studio Dark+\""
alias batlog="${batname} -pp -l log"

export MANPAGER="sh -c 'col -bx | ${batname} -l man -p'"
