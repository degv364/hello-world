#!/bin/bash

# Error codes definition
E_SVTO=1 # Shell version too old

# Bash vars
VERSION=$( bash --version | head -n 1 | grep -o '4.4' )
EMESSAGE='Error, Bash version too old, please use Bash on Archlinux.'
MESSAGE='Hello World'

if [ $VERSION ]
then
    echo $MESSAGE >&1
else
    echo $EMESSAGE >&2
    exit $E_SVTO
fi

# Executed without errors.
exit 0
