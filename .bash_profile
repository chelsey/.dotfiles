export HOME=/Users/chelseyfrank
export PATH="$HOME/usr/local/bin:/usr/local/sbin:$PATH"
source ~/.profile

export GOPATH="$HOME/dev/go"
export PATH="$GOPATH/bin:$PATH"

# Terminal config
YELLOW="\[\033[01;33m\]"
GREEN="\[\033[01;32m\]"
RED="\[\033[01;31m\]"
MAGENTA="\[\033[00;35m\]"
BLUE="\[\033[01;34m\]"
GRAY="\[\033[01;37m\]"

function parse_branch {
  # Set the BRANCH variable.
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    git_branch="$branch"
  else
    git_branch=""
  fi
  # git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function parse_git {
  git_status="$(git status 2> /dev/null)"
  if [[ $git_branch ]]; then
    if [[ ${git_status} == *"Changes to be committed:"* ]]; then
      echo $YELLOW $git_branch "📬"
      return
    elif [[ ${git_status} == *"Changes not staged"* ]]; then
      echo $RED $git_branch "📝"
      return
    elif [[ $(git log origin/HEAD..$git_branch) ]]; then
      # will always return green once there's a commit
      echo $GREEN $git_branch "📫 "
    else
      echo $GRAY $git_branch "🌟"
    fi
  fi
}

function current_time {
date +%H:%M
}

color_prompt=yes

function set_prompt {
  parse_branch
  PS1="$MAGENTA$(current_time) $BLUE\h\w $(parse_git)\n\[\e[0m\]→ "
}

PROMPT_COMMAND=set_prompt

# export EDITOR='subl -w'
export EDITOR=vim
export TERM=xterm-256color

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Z aliases
alias be='bundle exec'
alias bi='bundle install'

# S aliases


# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# https://github.com/pyenv/pyenv#basic-github-checkout
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Place toward the end of shell config; manipulates PATH during the initialize
eval "$(pyenv init -)"
