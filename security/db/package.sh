#!/bin/sh

pkgname=db
pkgver=6.0.20
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
  rm -rf ${pkgdir}/usr/share
  chown -v -R root:root \
    ${pkgdir}/usr/bin/db_* \
    ${pkgdir}/usr/include/db{,_185,_cxx}.h \
    ${pkgdir}/usr/lib/libdb*.{so,la}
}
