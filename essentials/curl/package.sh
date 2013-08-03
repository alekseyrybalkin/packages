#!/bin/sh

pkgname=curl
pkgver=7.31.0
extension=bz2
folder="http://${pkgname}.haxx.se/download/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
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
