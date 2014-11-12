#!/bin/sh

pkgname=libffi
pkgver=3.2.1
extension=gz
folder="ftp://sourceware.org/pub/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

ver_grep="^${pkgname}-[^-rc]*\.tar\.${extension}$"
urls="$urls http://www.linuxfromscratch.org/patches/blfs/svn/libffi-${pkgver}-includedir-1.patch"

kiin_make() {
  patch -Np1 -i ${KIIN_HOME}/tarballs/libffi-${pkgver}-includedir-1.patch
  ./configure --prefix=/usr \
    --disable-static \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
