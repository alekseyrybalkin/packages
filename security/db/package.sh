#!/bin/sh

pkgname=db
pkgver=5.3.21
urls="http://download.oracle.com/berkeley-db/db-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  cd build_unix
  ../dist/configure --prefix=/usr \
    --enable-compat185 \
    --enable-dbm \
    --disable-static \
    --enable-cxx
  make
}

kiin_install() {
  cd build_unix
  make DESTDIR=${pkgdir} docdir=/usr/share/doc/db install
  chown -v -R root:root \
    ${pkgdir}/usr/bin/db_* \
    ${pkgdir}/usr/include/db{,_185,_cxx}.h \
    ${pkgdir}/usr/lib/libdb*.{so,la} \
    ${pkgdir}/usr/share/doc/db
}
