#!/bin/sh

pkgname=sdl2
vcs="mercurial"
hg_pkgname="sdl"
hgtag="18f6818ba281"
pkgver=2.0.0
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  mkdir sdl-build
  cd sdl-build
  ../configure --prefix=/usr \
    --disable-video-opengles \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  cd sdl-build
  make DESTDIR=${pkgdir} install
  if [ -n "$KIIN_LIB32" ]; then
    ln -sv libSDL2-2.0.so.0 ${pkgdir}/usr/lib32/libsdl2-2.0.so.0
  fi
}
