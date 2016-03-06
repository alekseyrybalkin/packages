#!/bin/sh
cd /usr/lib/intellij-idea/bin/
_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true' ./idea.sh "$@"
