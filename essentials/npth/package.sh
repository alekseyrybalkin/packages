#!/bin/sh

pkgname=npth
pkgver=1.5
vcs=git
gittag=npth-${pkgver}
extension=bz2
folder="ftp://ftp.gnupg.org/gcrypt/npth/"
relmon_id=2505

. ${UNDEAD_REPO}/defaults.sh

undead_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
