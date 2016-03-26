#!/bin/sh

pkgname=libvorbis
pkgver=1.3.5
vcs=git
gittag=e9a1fd561632f7c9b7d2f58c95d374f8c9ab24f4
urls="http://downloads.xiph.org/releases/vorbis/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./autogen.sh
  ./configure --prefix=/usr \
    --disable-static \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
  install -v -m644 doc/Vorbis* ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
}
