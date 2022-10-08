# The following characters/symbols are based on the powerline-patched "consolas NF" font that
# can be downloaded at https://github.com/Znuff/consolas-powerline.

# Colors: https://misc.flogisoft.com/bash/tip_colors_and_formatting

SEPARATOR_CHAR=%{$reset_color%}$'\uF444'

function ruby_prompt() {
  if [[ $ZSH_THEME_DISABLE_RUBY_PROMPT ]]; then
    return ""
  fi

  local RUBY_VERSION
  local RUBY_CHAR=$'\uE791'
  # local RUBY_CHAR='\uE739'
  # local RUBY_CHAR='\uF43B'
  # local RUBY_CHAR='\uE23E'
  # local RUBY_CHAR='🔻'

  if [[ $(which ruby) =~ 'asdf' ]]; then
    RUBY_VERSION=$(asdf current ruby | sed s'/ruby[[:space:]]*//g' | sed s'/[[:space:]].*//g')
  elif [ $(command -v ruby) ]; then
    RUBY_VERSION=$(ruby --version | sed 's/ruby //g' | sed 's/ .*//g')
  fi

  if [ "$RUBY_VERSION" ]; then
    echo -n " $SEPARATOR_CHAR %f%{$FG[160]%}$RUBY_CHAR $RUBY_VERSION%{$reset_color%}"
  fi
}

function rails_prompt() {
  if [[ $ZSH_THEME_DISABLE_RAILS_PROMPT ]]; then
    return ""
  fi

  local RAILS_VERSION
  local RAILS_CHAR=$'\uE604'
  # local RAILS_CHAR='\uF239'
  # local RAILS_CHAR='🛤'

  if [ -f "Gemfile.lock" ]; then
    RAILS_VERSION=`cat Gemfile.lock | grep -E " +rails \([0-9]+" | sed 's/ *rails (\(.*\))/\1/'`
  fi

  if [ "$RAILS_VERSION" ]; then
    echo -n " $SEPARATOR_CHAR %{$FG[124]%}${RAILS_CHAR} ${RAILS_VERSION}%{$reset_color%}"
  fi
}

function os_char() {
  local MACOS_CHAR=$'\uF179'
  local UBUNTU_CHAR=$'\uF30C'
  # local UBUNTU_CHAR='\uE73A'
  local LINUX_CHAR=$'\uE712'
  local GENERIC_OS_CHAR=$'\uF26C'

  if [[ $(uname -a) =~ 'Darwin' ]]; then
    echo -n %{$FG[007]%}$MACOS_CHAR # in white
  elif [[ $(uname -a) =~ 'Ubuntu' ]]; then
    echo -n %{$FG[214]%}$UBUNTU_CHAR # in orange
  elif [[ $(uname -a) =~ 'Linux' ]]; then
    echo -n %{$FG[011]%}$LINUX_CHAR # in yellow
  else
    echo -n %{$FG[007]%}$GENERIC_OS_CHAR # in white
  fi
}

if [ $UID -eq 0 ]; then CARETCOLOR="red"; else CARETCOLOR="blue"; fi

COLOR_YELLOW=%{$FG[220]%}
COLOR_PURPLE_LIGHT=%{$FG[146]%}
COLOR_GREY_DARK=%{$FG[240]%}
COLOR_GIT_DIRTY=%{$FG[208]%}

PROMPT_HOST_PREFIX=$COLOR_GREY_DARK\{
PROMPT_HOST_SUFFIX=$COLOR_GREY_DARK\}
PROMPT_HOST_INFO=%m%{$reset_color%}
PROMPT_PATH_INFO=%{$reset_color%}%{$FG[034]%}%3~
PROMPT_ARROW=%{$FG[134]%}»%{${reset_color}%}

OS_CHAR=$(os_char)

PROMPT='$PROMPT_HOST_PREFIX $OS_CHAR $PROMPT_HOST_INFO$(ruby_prompt)$(rails_prompt) $PROMPT_HOST_SUFFIX $PROMPT_PATH_INFO $(git_prompt_info)
$PROMPT_ARROW '

PROMPT_GIT_PREFIX=$COLOR_GREY_DARK\(%{$reset_color%}
PROMPT_GIT_SUFFIX=$COLOR_GREY_DARK\)%{$reset_color%}

GIT_CHAR=$'\uE725'
# GIT_CHAR=$'\uF493'
# GIT_CHAR=$'\uE0A0'

GIT_DIRTY_CHAR=$'\uF069'
# GIT_DIRTY_CHAR=$'\uF292'
# GIT_DIRTY_CHAR=$'*'
# GIT_DIRTY_CHAR=$'\uE780'

ZSH_THEME_GIT_PROMPT_PREFIX="$PROMPT_GIT_PREFIX$COLOR_YELLOW$GIT_CHAR $COLOR_YELLOW"
ZSH_THEME_GIT_PROMPT_DIRTY="$COLOR_GIT_DIRTY$GIT_DIRTY_CHAR"
ZSH_THEME_GIT_PROMPT_SUFFIX="$PROMPT_GIT_SUFFIX%{$reset_color%}"
