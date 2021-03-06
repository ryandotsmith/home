set -o vi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Git completion...
. ~/.git-completion.bash
# In the prompt.
PS1='[ \W $(__git_ps1 "%s") ] '

export EDITOR=vim
export CLICOLOR=1

if [ $OSTYPE != 'darwin11' ]
then
  # renam caps lock to ctrl
  setxkbmap -option ctrl:nocaps
  alias ls="ls --color=auto"
fi

# Alias'
alias vi="vim"
alias doc="rlwrap ~/src/docbrown/bin/docbrown"
alias be="bundle exec"


# PATH
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/local/go/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# Ruby
eval "$(rbenv init -)"

# Go
export GOROOT="$HOME/local/go"
export GOPATH=$HOME

# TAT(1)
export CODE_ROOT_DIRS="$HOME/src"
source ~/src/tat/tat.sh

# Move config vars from one heroku app to another
# Example usage: cpenv app-prod app-staging
# Warning: will copy DATABASE_URL
function cpenv()
{
    heroku config -s -a "$1" | sed "/HEROKU_POSTGRE.*/d; /DATABASE_URL/d; /EMAIL.*/d; /BRAIN.*/d" | xargs -t -I % heroku config:add % -a "$2"
}
# When I curl a postgres dump from heroku,
# I will need to quickly import it into my local db.
# Example usage: rdb payments latest.db
function rdb()
{
    pg_restore --verbose --clean --no-acl --no-owner -h localhost -U `whoami` -d "$1" "$2"
}
# .env file has a list of shell vars (VAR=value)
# sperated by newlines. This function will quickly
# load the VARs in the file into the shell environment.
function ldenv()
{
    export $(cat .env)
}

function cloudset()
{
   if [ "$1" != "" ]; then
       export HEROKU_HOST="$1.herokudev.com"
   else
       unset HEROKU_HOST
   fi
}

function ct()
{
  if [ "$1" != "" ]; then
    clear && turn test/$1
  else
    clear && turn test/
  fi
}

function shoot()
{
  scrot '%Y-%m-%d_%H:%M:%S.png' -s -e 'cloudapp upload $f | xsel -i -b -p; rm $f'
}

function todo()
{
  git grep -e 'TODO' -e 'FIXME'
}
