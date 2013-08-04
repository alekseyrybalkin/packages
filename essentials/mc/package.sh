#!/bin/sh

pkgname=mc
pkgver=4.8.10
extension=xz
folder="http://ftp.midnight-commander.org/"
check_server=1

. ${KIIN_HOME}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr     \
              --enable-charset  \
              --disable-static  \
              --sysconfdir=/etc \
              --with-screen=slang
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  cp -v doc/keybind-migration.txt ${pkgdir}/usr/share/mc
}
