#!/bin/sh
if [[ "$PLATFORM" == "Linux" ]]
then
  alias open="xdg-open"
fi

alias lh="ls -lhart"
alias ll="ls -l"
alias flushdns='sudo discoveryutil udnsflushcaches'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
