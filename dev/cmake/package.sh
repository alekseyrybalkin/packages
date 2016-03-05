#!/bin/sh

pkgname=cmake
majorver=3.4
pkgver=${majorver}.3
extension=gz
folder="http://www.cmake.org/files/v${majorver}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  ./bootstrap --prefix=/usr \
    --system-libs \
    --mandir=/share/man \
    --docdir=/share/doc/cmake \
    --no-system-jsoncpp \
    --no-system-libarchive
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  # remove files with spaces
  rm -rf ${pkgdir}/usr/share/cmake-${majorver}/Help/generator
}
