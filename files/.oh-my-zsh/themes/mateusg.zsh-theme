function rvm_gemset_prompt() {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  if [ "$gemset" != "" ]; then
    echo "@$gemset"
  fi
}

function ruby_prompt() {
  if [ -s "$HOME/.rvm/scripts/rvm" ]; then
    echo $(rvm-prompt)
  elif [ -s "$HOME/.rbenv" ]; then
    echo $(rbenv version | sed -e 's/ .*//')
  fi
}

function rails_prompt() {
  local RAILS_VERSION
  if [ -f "Gemfile.lock" ]; then
    RAILS_VERSION=`cat Gemfile.lock | grep -E " +rails \([0-9]+" | sed 's/ *rails (\(.*\))/\1/'`
  fi

  if [ "$RAILS_VERSION" ]; then
    local RAILS_PROMPT=" -> %{$FG[124]%}${RAILS_VERSION}%{$reset_color%}"
  fi
  echo $RAILS_PROMPT
}

function spacing_and_prompt_arrow() {
  echo "\n»"
}

if [ $UID -eq 0 ]; then CARETCOLOR="red"; else CARETCOLOR="blue"; fi

# %U%m%u  host
PROMPT='%{$FG[146]%}{ %f%{$FG[137]%}$(ruby_prompt)%{$reset_color%}$(rails_prompt) %{$FG[146]%}} %{$reset_color%}%{$FG[106]%}%3~ $(git_prompt_info)%{$FG[111]%}
»%{${reset_color}%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[220]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[220]%}] %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[214]%}*"
