#!/bin/sh

#vcs=none
pkgname=bc
pkgver=1.06.95
extension=bz2
folder="http://alpha.gnu.org/gnu/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    patch -Np1 -i ../bc-${pkgver}-memory_leak-1.patch
    ./configure --prefix=/usr \
        --mandir=/usr/share/man \
        --infodir=/usr/share/info \
        --with-readline
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
