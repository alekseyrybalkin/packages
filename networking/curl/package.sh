#!/bin/sh

pkgname=curl
pkgver=7.42.0
extension=bz2
folder="http://${pkgname}.haxx.se/download/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr \
    --disable-static \
    --enable-threaded-resolver \
    --libdir=${LIBDIR}
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  find docs \( -name "Makefile*" -o -name "*.1" -o -name "*.3" \) -exec rm {} \;
  install -v -d -m755 ${pkgdir}/usr/share/doc/curl
  cp -v -R docs/*     ${pkgdir}/usr/share/doc/curl
}