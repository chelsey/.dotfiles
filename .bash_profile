export HOME=/Users/chelseyfrank
export PATH="/usr/local/bin:$PATH"
source ~/.profile

export GOPATH="$HOME/dev/go"

export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"


# Terminal config
function current_branch {
  git rev-parse --symbolic-full-name --abbrev-ref HEAD
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

function current_time {
   date +%H:%M
}

color_prompt=yes

PS1='$(current_time) \[\033[01;36m\]\h:\w\[\033[00m\] $(parse_git_branch )\n→ '

export TERM=xterm-256color
export EDITOR='subl -w'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias sublime='open -a /Applications/Sublime\ Text.app'
alias sub='sublime'

# Unix aliases
alias ll='ls -la'
alias lh='ls -lh'
alias h='history'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'

# Git aliases
alias gcb='git checkout -b'
alias gcdp='git checkout develop ; git pull origin develop'
alias gcne='git commit --amend --no-edit'
alias gfp='git push origin $(current_branch) -f'

# Z aliases
alias be='bundle exec'
alias bi='bundle install'
alias go='bundle exec foreman start'

# S aliases


# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# https://github.com/pyenv/pyenv#basic-github-checkout
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Place toward the end of shell config; manipulates PATH during the initialize
eval "$(pyenv init -)"
