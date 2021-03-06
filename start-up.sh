#!/bin/bash
source ~/.profile
# Load RVM into a shell session *as a function*
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
  # First try to load from a user install
  source "$HOME/.rvm/scripts/rvm"
elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then
  # Then try to load from a root install
  source "/usr/local/rvm/scripts/rvm"
else
  printf "ERROR: An RVM installation was not found.\n"
fi

export HUBOT_FLOWDOCK_LOGIN_EMAIL ="joshbot@cheezburger.com"
export HUBOT_FLOWDOCK_LOGIN_PASSWORD ="happy4icanhas"
export HUBOT_AUTH_ADMIN ="Josh"

./bin/hubot -a flowdock -d --name JoshBot