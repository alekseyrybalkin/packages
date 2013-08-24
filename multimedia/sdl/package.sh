#!/bin/sh

pkgname=sdl
vcs="mercurial"
hgtag="952791dbe6ba"
pkgver=1.2.15+
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  mkdir sdl-build
  cd sdl-build
  ../configure --prefix=/usr \
    --enable-alsa \
    --with-x \
    --disable-static \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  cd sdl-build
  make DESTDIR=${pkgdir} install
}
