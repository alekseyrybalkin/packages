#!/bin/sh

pkgname=mplayer
vcs="git"
pkgver=36546
gittag=`pushd ${SOURCES_HOME}/mplayer >/dev/null && git log | head -n 1000 | grep "^    git-svn-id\|^commit" | grep -B 1 "trunk@${pkgver}" | head -n 1 | cut -d ' ' --fields=2 && popd >/dev/null`
srcdir=${location}/MPlayer-${pkgver}

kiin_make() {
  git clone $SOURCES_HOME/ffmpeg ffmpeg
  cd ffmpeg
  git checkout n2.1.1
  cd ..
  ./configure --prefix=/usr \
    --confdir=/etc/mplayer \
    --enable-dynamic-plugins \
    --disable-libvpx-lavc \
    --disable-gui \
    --disable-dvdread-internal \
    --disable-xss \
    --disable-liblzo
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
