#!/bin/sh

pkgname=sdl_mixer
ARCH_NAME_LIB32=sdl_mixer
pkgver=1.2.12
urls="http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-${pkgver}.tar.gz"
srctar=SDL_mixer-${pkgver}.tar.gz
srcdir=${location}/SDL_mixer-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --disable-static \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
