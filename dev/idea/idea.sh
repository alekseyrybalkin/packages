#!/bin/sh
cd /usr/share/idea/bin/
_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true' ./idea.sh "$@"
