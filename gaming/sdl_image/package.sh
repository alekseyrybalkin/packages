#!/bin/sh

pkgname=sdl_image
ARCH_NAME_LIB32=sdl_image
pkgver=1.2.12
urls="http://www.libsdl.org/projects/SDL_image/release/SDL_image-${pkgver}.tar.gz"
srctar=SDL_image-${pkgver}.tar.gz
srcdir=${location}/SDL_image-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --disable-static \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
