autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo "on %{$fg[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "on %{$fg[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return
 echo "${ref#refs/heads/}"
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

asdf_version() {
  echo "$(cat .tool-versions | paste -sd , -)"
}

asdf_prompt() {
  if [[ -f .tool-versions ]]
  then
    echo "%{$fg[yellow]%}$(asdf_version)%{$reset_color%} in "
  else
    echo ""
  fi
}

directory_name() {
  echo "%{$fg[cyan]%}%~%{$reset_color%}"
}

return_status() {
  echo "%(?:%{$fg[green]%}➜ :%{$fg[red]%}➜ %s)"
}

# Old oh-my-zsh PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_>'
# Using rbenv (must figure out how to use asdf) - export PROMPT=$'\n$(rb_prompt)in $(directory_name) $(git_dirty)$(need_push)\n$(return_status) '
export PROMPT=$'\n$(asdf_prompt)$(directory_name) $(git_dirty)$(need_push)\n$(return_status) '
set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
