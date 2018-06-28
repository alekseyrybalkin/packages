#!/bin/sh

pkgname=libassuan
pkgver=2.5.1
vcs=git
gittag=libassuan-${pkgver}
extension=bz2
folder="ftp://ftp.gnupg.org/gcrypt/libassuan/"
relmon_id=1559

. ${UNDEAD_REPO}/defaults.sh

undead_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu \
        --enable-maintainer-mode
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
