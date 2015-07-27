#!/bin/sh

if test ! $(which chruby)
then
  echo "  Installing chruby for you."
	if [ "$PLATFORM" == "Darwin" ]
	then
  		brew install chruby > /tmp/chruby-install.log
	fi
fi

if test ! $(which ruby-build)
then
  echo "  Installing ruby-build for you."
  	if [ "$PLATFORM" == "Darwin" ]
	then
  		brew install ruby-build > /tmp/ruby-build-install.log
  	fi
fi
