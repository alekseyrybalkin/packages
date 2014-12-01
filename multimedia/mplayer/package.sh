#!/bin/sh

pkgname=mplayer
vcs="git"
pkgver=37228
gittag=`pushd ${SOURCES_HOME}/mplayer >/dev/null && git log | head -n 1000 | grep "^    git-svn-id\|^commit" | grep -B 1 "trunk@${pkgver}" | head -n 1 | cut -d ' ' --fields=2 && popd >/dev/null`
srcdir=${location}/MPlayer-${pkgver}

urls="http://rybalkin.org/kiin-files/mplayer-revert-icl-fixes.patch \
  http://rybalkin.org/kiin-files/mplayer-giflib51.patch"

kiin_make() {
  git clone $SOURCES_HOME/ffmpeg ffmpeg

  patch -Np0 -i ${KIIN_HOME}/tarballs/mplayer-revert-icl-fixes.patch
  patch -Np0 -i ${KIIN_HOME}/tarballs/mplayer-giflib51.patch

  cd ffmpeg
  git checkout n2.2.10
  cd ..
  sed -i -e 's/\.mplayer/\.config\/mplayer/g' path.c
  ./configure --prefix=/usr \
    --confdir=/etc/mplayer \
    --enable-dynamic-plugins \
    --disable-libvpx-lavc \
    --disable-gui \
    --disable-dvdread \
    --disable-dvdread-internal \
    --disable-xss \
    --disable-liblzo \
    --disable-faad
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
