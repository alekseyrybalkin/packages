#!/bin/sh

pkgname=cmake
majorver=3.0
pkgver=${majorver}.2
extension=gz
major_folder="http://www.cmake.org/files/"
check_server=1

. ${KIIN_REPO}/defaults.sh

folder="${major_folder}v${majorver}/"
urls="${folder}${srctar}"
majorver_grep="^v3\.[0-9]+/?$"
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
  rm -rf ${pkgdir}/usr/share/cmake-3.0/Help/generator
}
