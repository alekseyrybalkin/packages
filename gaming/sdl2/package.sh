#!/bin/sh

pkgname=sdl2
pkgver=2.0.2
urls="http://www.libsdl.org/release/SDL2-${pkgver}.tar.gz"
srctar=SDL2-${pkgver}.tar.gz
srcdir=${location}/SDL2-${pkgver}

kiin_make() {
  mkdir sdl-build
  cd sdl-build
  ../configure --prefix=/usr \
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
