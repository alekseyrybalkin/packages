#!/bin/sh

pkgname=man-db
pkgver=2.7.5
vcs=git
gittag=${pkgver}
urls="http://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  autoreconf -fi
  ./configure --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --docdir=/usr/share/doc/man-db \
    --sysconfdir=/etc \
    --disable-setuid \
    --with-browser=/usr/bin/lynx \
    --with-vgrind=/usr/bin/vgrind \
    --with-grap=/usr/bin/grap
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
