#!/usr/bin/env bash

echo "
####################################
Installing Ruby, Bundler, & Rails...
####################################
"

source $HOME/.rvm/scripts/rvm

echo "gem: --no-document" >> ~/.gemrc
rvm use --default --install $1 --create

shift

if (( $# ))
then gem install $@
fi

rvm cleanup all
