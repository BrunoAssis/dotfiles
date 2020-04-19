#!/bin/sh
if [[ "$PLATFORM" == "Linux" ]]
then
  alias open="xdg-open"
fi

alias ls="ls --color=auto"
alias lh="ls -lhart"
alias ll="ls -l"
alias flushdns='sudo discoveryutil udnsflushcaches'
