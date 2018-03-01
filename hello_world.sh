#!/bin/bash
# Error codes definition
E_SVTO=1 # Shell version too old
# Bash vars
VERSION=$( bash --version | head -n 1 | grep -o '4\.[4-9]\{1\}' )
EMESSAGE='\x45\x72\x72\x6F\x72\x2C\x20\x42\x61\x73\x68\x20\x76\x65\x72\x73\x69\x6F\x6E\x20\x74\x6F\x6F
\x6F\x6C\x64\x2C\x20\x70\x6C\x65\x61\x73\x65\x20\x75\x73\x65\x20\x42\x61\x73\x68\x20\x6F\x6E
\x41\x72\x63\x68\x6C\x69\x6E\x75\x78\x21\x21'
MESSAGE=' \x27 \x48 \x65 \x6C \x6C \x6F \x20 \x57 \x6F \x72 \x6C \x64 \x27'
RAND_MESSAGE=''
for CHAR in $MESSAGE
do
    if [ "$CHAR" != '\x20' ]&&[ "$CHAR" != '\x27' ]&&[ $(( $RANDOM%2 )) -eq 1 ] ; then
	if [ ${CHAR:2:1} -gt 5 ] ; then
	    RAND_MESSAGE=$RAND_MESSAGE'\x'$(( ${CHAR:2:1} -2 ))${CHAR:3:1}
	else
	    RAND_MESSAGE=$RAND_MESSAGE'\x'$(( ${CHAR:2:1} +2 ))${CHAR:3:1}
	fi
    else
	RAND_MESSAGE=$RAND_MESSAGE$CHAR
    fi
done
if [ $VERSION ] ; then echo -e $RAND_MESSAGE >&1 ; else echo -e $EMESSAGE >&2 ; exit $E_SVTO ; fi
exit 0 # Executed without errors.
