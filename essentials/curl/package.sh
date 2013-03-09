#!/bin/sh

pkgname=curl
pkgver=7.29.0
urls="http://${pkgname}.haxx.se/download/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i '/--static-libs)/{N;s#echo .*#echo #;}' curl-config.in
  ./configure --prefix=/usr \
    --disable-static \
    --with-ca-path=/etc/ssl/certs \
    --enable-threaded-resolver
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  find docs \( -name "Makefile*" -o -name "*.1" -o -name "*.3" \) -exec rm {} \;
  install -v -d -m755 ${pkgdir}/usr/share/doc/curl
  cp -v -R docs/*     ${pkgdir}/usr/share/doc/curl
}
