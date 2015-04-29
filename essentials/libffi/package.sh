#!/bin/sh

pkgname=libffi
pkgver=3.2.1
vcs=git
gittag=v${pkgver}
extension=gz
folder="ftp://sourceware.org/pub/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

ver_grep="^${pkgname}-[^-rc]*\.tar\.${extension}$"

kiin_make() {
  ./autogen.sh
  ./configure --prefix=/usr \
    --disable-static \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  if [ -z "${KIIN_LIB32}" ]; then
    mv ${pkgdir}/usr/lib64/* ${pkgdir}/usr/lib/
    rmdir ${pkgdir}/usr/lib64
  fi
}
