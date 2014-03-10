#!/bin/sh

pkgname=cmake
majorver=2.8
pkgver=${majorver}.12.2
extension=gz
major_folder="http://www.cmake.org/files/"
check_server=1

. ${KIIN_REPO}/defaults.sh

folder="${major_folder}v${majorver}/"
urls="${folder}${srctar}"
majorver_grep="^v2\.[0-9]+/?$"
majorver_seds() {
  sed -r "s/\///g" | sed -r "s/^v//g"
}
urls="${urls} http://www.linuxfromscratch.org/patches/blfs/svn/cmake-${pkgver}-freetype-1.patch"

kiin_make() {
  patch -Np1 -i ${KIIN_HOME}/tarballs/cmake-${pkgver}-freetype-1.patch
  ./bootstrap --prefix=/usr \
    --system-libs \
    --mandir=/share/man \
    --docdir=/share/doc/cmake \
    --no-system-libarchive
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
