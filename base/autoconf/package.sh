#!/bin/sh

pkgname=autoconf
pkgver=2.69
vcs=git
gittag=v${pkgver}
extension=xz
folder="http://ftp.gnu.org/gnu/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

ver_grep="^${pkgname}-[0-9\.]*\.tar\.${extension}$"

kiin_make() {
  autoreconf -fi
  ./configure --prefix=/usr
  echo -e "all:\n\ninstall:" > doc/Makefile
  echo -e "all:\n\ninstall:" > man/Makefile
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
