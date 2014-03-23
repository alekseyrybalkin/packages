#!/bin/sh

pkgname=sdl2_image
ARCH_NAME_LIB32=sdl2_image
pkgver=2.0.0
urls="http://www.libsdl.org/projects/SDL_image/release/SDL2_image-${pkgver}.tar.gz"
srctar=SDL2_image-${pkgver}.tar.gz
srcdir=${location}/SDL2_image-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --disable-static \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
