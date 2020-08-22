# alias sublime='open -a /Applications/Sublime\ Text.app'
# alias sub='sublime'

# Unix aliases
alias ;s='ls'
alias ll='ls -la'
alias lh='ls -lh'
alias h='history'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'

 #############
# Git aliases #
 #############
alias current_branch='git rev-parse --abbrev-ref HEAD'

# Workflow control
alias gs='git status'
alias gco='git checkout'
alias gcob='gco -b'
# alias gcdp='git checkout develop ; git pull origin develop'
alias gpom='git checkout master; git pull origin master'
alias gcne='git commit --amend --no-edit'
alias gp='git push origin $(current_branch)'
alias gfp='git push origin $(current_branch) -f'

alias gcu='git clean -f -d'

# Logging & history
alias gdlc='git diff --cached HEAD^' # show a diff of last commit
alias gl='git log --color --graph --abbrev-commit --decorate' # list commits
alias gll='gl --numstat' # list commits w/ list of changed files

# Searching
alias ggfn='git ls-files | grep -i'
alias gvisual='gitk' # Run a git graphical user interface on top of your git directory.

  ######
# Random #
  ######
alias wipehosts='cat /dev/null > ~/.ssh/known_hosts'
alias wh='wipehosts'

alias tf='terraform'
# alias python='/usr/bin/python2.7'

  ######
# Docker #
  ######
alias dbuild='docker build'
alias drun='docker run --rm -it'
alias dkillall='docker kill $(docker ps -q)'

  ######
# Golang #
  ######
alias gb='go build'
