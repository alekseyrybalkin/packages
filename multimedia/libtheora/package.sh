#!/bin/sh

pkgname=libtheora
pkgver=1.1.1
urls="http://downloads.xiph.org/releases/theora/libtheora-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  # http://forums.gentoo.org/viewtopic-t-984400.html?sid=d3c947c3a5ee63de38511920a756f2ef
  export LDFLAGS="$LDFLAGS -lm"
  sed -i 's/png_\(sizeof\)/\1/g' examples/png2theora.c
  ./configure --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
