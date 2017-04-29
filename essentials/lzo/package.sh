#!/bin/sh

#vcs=none
pkgname=lzo
pkgver=2.10
extension=gz
folder="http://www.oberhumer.com/opensource/${pkgname}/download/"
check_server=1
relmon_id=1868

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    ./configure --prefix=/usr --enable-shared --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
