export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Setting the editor of choice
export EDITOR='vim'
export GIT_EDITOR='vim'
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
export NODE_PATH="/usr/local/lib/node_modules"

# Link to personal wiki
alias wiki='vim ~/Dropbox/Wiki/'

# General aliases
alias fucking='sudo'
alias la='ls -al'
alias grep='grep --colour=always'
alias reload='source ~/.dotfiles/config/global.sh'

# Moving to directories
alias projects='cd ~/Projects'
alias dotfiles='vim ~/.dotfiles'

# Ruby aliases
alias rdm='rake db:migrate db:test:prepare'
alias c='bundle exec cucumber -r features'
alias wip='c --profile wip'
alias be='bundle exec'
alias irb='pry'
alias guard='bundle exec guard'
alias rspec='rspec --colour'

# Git aliases
alias groot='cd $(git rev-parse --show-toplevel)' # Go to the root directory of the git project
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
alias gclean='git branch --merged | grep -v master | grep -v "^\*" | cut -d " " -f3 | xargs git branch -d'

# Mvn aliases
alias mci='mvn clean install'

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

# Seems to be the best OS X jump-to-github alias from http://tinyurl.com/2mtncf
function github-go () {
  open $(github-url)
}

# grep for a process
function psg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ps aux | grep "[$FIRST]$REST"
}
