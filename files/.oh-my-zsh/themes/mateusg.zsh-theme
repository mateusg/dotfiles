BRANCH_CHAR=$'\uE0A0'
ARROW_CHAR='\uF44A'

function ruby_prompt() {
  local RUBY_VERSION
  local RUBY_CHAR='\uE23E'
  # local RUBY_CHAR='🔻'

  if [[ $(which ruby) =~ 'asdf' ]]; then
    RUBY_VERSION=$(asdf current ruby | sed s'/ruby[[:space:]]*//g' | sed s'/[[:space:]].*//g')
  elif [ $(command -v ruby) ]; then
    RUBY_VERSION=$(ruby --version | sed 's/ruby //g' | sed 's/ .*//g')
  fi

  if [ "$RUBY_VERSION" ]; then
    echo -n "%f%{$FG[160]%}$RUBY_CHAR $RUBY_VERSION%{$reset_color%}"
  fi
}

function rails_prompt() {
  local RAILS_VERSION
  local RAILS_CHAR='\uE604'
  # local RAILS_CHAR='🛤'

  if [ -f "Gemfile.lock" ]; then
    RAILS_VERSION=`cat Gemfile.lock | grep -E " +rails \([0-9]+" | sed 's/ *rails (\(.*\))/\1/'`
  fi

  if [ "$RAILS_VERSION" ]; then
    echo -n "  %{$FG[124]%}${RAILS_CHAR} ${RAILS_VERSION}%{$reset_color%}"
  fi
}

if [ $UID -eq 0 ]; then CARETCOLOR="red"; else CARETCOLOR="blue"; fi


PROMPT='%{$FG[146]%}{ %n@%m $(ruby_prompt)$(rails_prompt) %{$FG[146]%}} %{$reset_color%}%{$FG[106]%}%3~ $(git_prompt_info)%{$FG[111]%}
»%{${reset_color}%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[220]%}$(echo $BRANCH_CHAR)_"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[220]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[214]%}*%{$reset_color%}"
