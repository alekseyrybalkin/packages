#!/bin/sh
cd /usr/share/ideau/bin/
_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true' ./idea.sh "$@"
