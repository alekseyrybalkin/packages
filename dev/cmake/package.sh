#!/bin/sh

pkgname=cmake
majorver=2.8
pkgver=${majorver}.12
extension=gz
major_folder="http://www.cmake.org/files/"
check_server=1

. ${KIIN_HOME}/defaults.sh

folder="${major_folder}v${majorver}/"
urls="${folder}${srctar}"
majorver_grep="^v[0-9]+\.[0-9]+/?$"
majorver_seds() {
  sed -r "s/\///g" | sed -r "s/^v//g"
}

kiin_make() {
  ./bootstrap --prefix=/usr \
    --system-libs \
    --mandir=/share/man \
    --docdir=/share/doc/cmake-${pkgver} \
    --no-system-libarchive
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
