#!/bin/sh
cd /usr/lib/intellij-idea/bin/
_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd -Dsun.java2d.xrender=true -Dswing.aatext=true' ./idea.sh "$@"
