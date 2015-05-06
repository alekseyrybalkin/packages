#!/bin/sh

pkgname=sdl2
ARCH_NAME_LIB32=sdl2
pkgver=2.0.3
vcs=mercurial
hg_repo=http://hg.libsdl.org/SDL
hg_pkgname=sdl
hgtag=release-${pkgver}
srcdir=${location}/SDL2-${pkgver}

kiin_make() {
  ./autogen.sh
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
