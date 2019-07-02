#!/bin/sh

pkgname=npth
pkgver=1.6
vcs=git
gittag=npth-${pkgver}
extension=bz2
folder="ftp://ftp.gnupg.org/gcrypt/npth/"
relmon_id=2505

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
