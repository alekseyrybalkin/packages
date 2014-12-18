#!/bin/sh

pkgname=cmake
majorver=3.1
pkgver=${majorver}.0
extension=gz
major_folder="http://www.cmake.org/files/"
check_server=1

. ${KIIN_REPO}/defaults.sh

folder="${major_folder}v${majorver}/"
urls="${folder}${srctar}"
majorver_grep="^v3\.[02468]{1}/?$"
majorver_seds() {
  sed -r "s/\///g" | sed -r "s/^v//g"
}

kiin_make() {
  ./bootstrap --prefix=/usr \
    --system-libs \
    --mandir=/share/man \
    --docdir=/share/doc/cmake \
    --no-system-libarchive
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  # remove files with spaces
  rm -rf ${pkgdir}/usr/share/cmake-${majorver}/Help/generator
}
