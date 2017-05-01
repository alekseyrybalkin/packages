#!/bin/sh

pkgname=libassuan
pkgver=2.4.3
vcs=git
gittag=libassuan-${pkgver}
extension=bz2
folder="ftp://ftp.gnupg.org/gcrypt/libassuan/"
relmon_id=1559

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu \
        --enable-maintainer-mode
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
