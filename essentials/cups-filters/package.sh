#!/bin/sh

pkgname=cups-filters
pkgver=1.0.36
urls="http://www.openprinting.org/download/cups-filters/cups-filters-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --docdir=/usr/share/doc/cups-filters \
    --without-rcdir \
    --with-gs-path=/usr/bin/gs \
    --with-pdftops-path=/usr/bin/gs \
    --disable-avahi \
    --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
