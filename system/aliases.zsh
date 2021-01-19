#!/bin/sh
if [[ "$PLATFORM" == "Linux" ]]
then
  alias open="xdg-open"
  alias ls="ls --color=auto"
fi

alias lh="ls -lhart"
alias ll="ls -l"
alias flushdns='sudo discoveryutil udnsflushcaches'
