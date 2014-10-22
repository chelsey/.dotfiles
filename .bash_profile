export PATH="/Applications/Sublime Text 2.app/Contents/SharedSupport/bin":$PATH
export PATH="/Users/chelseyfrank/.rbenv/shims:${PATH}"

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}

function current_time {
   date +%H:%M
}

color_prompt=yes

PS1='$(current_time) \[\033[01;36m\]\h:\w\[\033[00m\] $(parse_git_branch )\n→ '

#source ~/.git-completion.sh
# source ~/.git-flow-completion.bash

# . ~/.ruby_gc_settings


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export TERM=xterm-256color
export EDITOR='subl -w'

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls -h --color=auto'
    alias grep='grep --color=auto'
fi

alias be='bundle exec'
alias bi='bundle install'
alias sublime='open -a /Applications/Sublime\ Text\ 2.app'
alias sub='sublime'
alias go='bundle exec foreman start'

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

export PATH=/usr/local/bin:$PATH
export PGHOST=localhost