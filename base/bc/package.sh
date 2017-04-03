#!/bin/sh

#vcs=none
pkgname=bc
pkgver=1.07
extension=gz
folder="ftp://ftp.gnu.org/gnu/${pkgname}/"
check_server=1
relmon_id=170

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    ./configure --prefix=/usr \
        --mandir=/usr/share/man \
        --infodir=/usr/share/info \
        --with-readline
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
