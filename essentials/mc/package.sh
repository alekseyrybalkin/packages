#!/bin/sh

pkgname=mc
pkgver=4.8.13
extension=xz
folder="http://ftp.midnight-commander.org/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
  ./configure --prefix=/usr \
    --libexecdir=/usr/lib \
    --enable-charset \
    --disable-static \
    --sysconfdir=/etc \
    --with-screen=slang
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  cp -v doc/keybind-migration.txt ${pkgdir}/usr/share/mc
}
