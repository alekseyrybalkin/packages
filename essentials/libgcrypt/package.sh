#!/bin/sh

pkgname=libgcrypt
pkgver=1.8.1
vcs=git
gittag=libgcrypt-${pkgver}
extension=bz2
folder="ftp://ftp.gnupg.org/gcrypt/${pkgname}/"
check_server=1
relmon_id=1623

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    ./autogen.sh
    ./configure --disable-doc \
        --enable-maintainer-mode \
        --prefix=/usr \
        --build=x86_64-unknown-linux-gnu \
        --libdir=${LIBDIR}
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
