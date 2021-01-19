if [[ "$PLATFORM" == "Darwin" ]]
then
    . /opt/homebrew/opt/asdf/asdf.sh
fi

if [[ "$PLATFORM" == "Linux" ]]
then
    . $HOME/.asdf/asdf.sh
fi