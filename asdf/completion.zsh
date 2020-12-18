# append completions to fpath
fpath=(~/.asdf/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit