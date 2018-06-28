#!/bin/sh

pkgname=libksba
pkgver=1.3.5
vcs=git
gittag=libksba-${pkgver}
extension=bz2
folder="ftp://ftp.gnupg.org/gcrypt/libksba/"
relmon_id=1649

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
