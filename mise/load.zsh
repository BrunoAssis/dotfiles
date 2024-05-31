if [[ "$PLATFORM" == "Darwin" ]]
then
    eval "$($HOMEBREW_PREFIX/bin/mise activate zsh)"
fi

if [[ "$PLATFORM" == "Linux" ]]
then
    eval "$($HOME/.local/bin/mise activate zsh)"
fi