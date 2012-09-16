#!/bin/sh

pkgname=man-db
pkgver=2.6.2
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e '/gets is a/d' gnulib/lib/stdio.in.h
  ./configure --prefix=/usr                        \
              --libexecdir=/usr/lib                \
              --docdir=/usr/share/doc/man-db-2.6.2 \
              --sysconfdir=/etc                    \
              --disable-setuid                     \
              --with-browser=/usr/bin/lynx         \
              --with-vgrind=/usr/bin/vgrind        \
              --with-grap=/usr/bin/grap
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
