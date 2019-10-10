export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Setting the editor of choice
export EDITOR='nvim'
export GIT_EDITOR='nvim'
export VISUAL=$EDITOR
export SVN_EDITOR=$EDITOR
export BUNDLER_EDITOR=$EDITOR
export GEMEDITOR=$EDITOR

# Ruby Optimalizations
export RUBY_GC_HEAP_INIT_SLOTS=1100000
export RUBY_GC_MALLOC_LIMIT=110000000
export RUBY_HEAP_FREE_MIN=20000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1


# Paths
export PATH="/usr/local/bin:/opt/local/bin:$PATH"
if [[ -d "$HOME/.rvm/bin" ]]; then
  export PATH=$PATH:$HOME/.rvm/bin
fi
if [[ -d "/usr/local/sbin" ]]; then
  export PATH=$PATH:/usr/local/sbin
fi
export PATH=$PATH:$HOME/.dotfiles/bin
# Load Node.js bin:
export PATH="/usr/local/share/npm/bin:$PATH"
# export NODE_PATH="/usr/local/lib/node_modules"

# Load Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Use nvim instead of vim, even when I accidently type vim
alias vim='nvim'

# Load Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Load ASDF
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Link to personal wiki
alias wiki='nvim ~/Dropbox/Wiki/'

# General aliases
alias fucking='sudo'
alias la='ls -alh'
alias grep='grep --colour=always'
alias reload='source ~/.dotfiles/config/global.sh'

# Moving to directories
alias p='cd ~/Projects'
alias projects='cd ~/Projects'
alias dot='nvim ~/.dotfiles'
alias dotfiles='cd ~/.dotfiles'

# Ruby
alias rdm='rake db:migrate db:test:prepare'
alias c='bundle exec cucumber -r features'
alias wip='c --profile wip'
alias be='bundle exec'
alias bi='bundle install'
alias irb='pry'
alias guard='bundle exec guard'
alias rspec='rspec --colour'
alias rc='rubocop'
alias rca='rubocop -a'
alias fms='foreman start'

# Git
alias groot='cd $(git rev-parse --show-toplevel)' # Go to the root directory of the git project
alias gclean='git branch --merged | grep -v master | grep -v "^\*" | cut -d " " -f3 | xargs git branch -d'
alias gst='git status'
alias gca='git commit -av'
alias gaa='git add --all'
alias gap='git add -p'
alias gd='git diff'
alias gdc='git diff --cached'
alias grh='git reset --hard'
alias gb='git branch'
alias gba='git branch -a'
alias gbD='git branch -D'
alias gp='git push'
alias gpu='git push --set-upstream'
alias gs='git stash'
alias gsp='git stash pop'
alias gf='git fetch'
alias grp='git remote prune'
alias gh='open $(github-url)'

# Mvn
alias mci='mvn clean install'

# GoLang
alias got='export GOPATH=`pwd`;export GO_CONFIG=$GOPATH/config/test.conf; go test'

# Gulp
alias gw='gulp watch'

# Yarn
alias yb='yarn build'
alias ysa="yarn start:all"

alias yt='yarn test'
alias ytw='yarn test --watch'

alias yl='yarn lint'
alias ysf='yarn standard --fix'

# Automatically add all ssh keys to ssh agent
function sshkeys() {
  find ~/.ssh/keys -not -name '*.pub' -type f | xargs ssh-add
}

function r() {
  if [ -f "./script/rails" ]; then
    ./script/rails $*
  else
    ./bin/rails $*
  fi
}

# checks to see if bundler is installed, if it isn't it will install it
# checks to see if your bundle is complete, runs bundle install if it isn't
# if any arguments have been passed it will run it with bundle exec
function b() {
  gem which bundler > /dev/null 2>&1 || gem install bundler --no-ri --no-rdoc
  bundle check || bundle install
  if [ $1 ]; then
    bundle exec $*
  fi
}

# unstage and by making it a function it will autocomplete files
unstage() {
  git reset HEAD -- $*
  echo
  git status
}

function github-init () {
  git config branch.$(git-branch-name).remote origin
  git config branch.$(git-branch-name).merge refs/heads/$(git-branch-name)
}

function github-url () {
  git config remote.origin.url | sed -En 's/git(@|:\/\/)github.com(:|\/)(.+)\/(.+).git/https:\/\/github.com\/\3\/\4/p'
}

# grep for a process
function psg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ps aux | grep "[$FIRST]$REST"
}
