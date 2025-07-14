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

mise_version() {
  local output=$(mise ls -c --no-header)
  local local_tools=""
  local global_tools=""
  
  while IFS= read -r line; do
    if [[ -n "$line" ]]; then
      local tool=$(echo "$line" | awk '{print $1}')
      local version=$(echo "$line" | awk '{print $2}')
      local location=$(echo "$line" | awk '{print $3}')
      
      if [[ "$location" == *"/.config/mise/config.toml" ]]; then
        if [[ -n "$global_tools" ]]; then
          global_tools="$global_tools, $tool $version"
        else
          global_tools="$tool $version"
        fi
      else
        if [[ -n "$local_tools" ]]; then
          local_tools="$local_tools, $tool $version"
        else
          local_tools="$tool $version"
        fi
      fi
    fi
  done <<< "$output"
  
  local result=""
  if [[ -n "$local_tools" ]]; then
    result="$local_tools"
  fi
  
  if [[ -n "$global_tools" ]]; then
    if [[ -n "$result" ]]; then
      result="$result 🌎 $global_tools"
    else
      result="🌎 $global_tools"
    fi
  fi
  
  echo "$result"
}

mise_prompt() {
  if (( $+commands[mise] ))
  then
    echo "%{$fg[yellow]%}$(mise_version)%{$reset_color%} in "
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

export PROMPT=$'\n$(mise_prompt)$(directory_name) $(git_dirty)$(need_push)\n$(return_status) '
set_prompt () {
  export RPROMPT="%{$fg_bold[cyan]%}%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
