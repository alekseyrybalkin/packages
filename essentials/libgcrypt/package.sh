#!/bin/sh

pkgname=libgcrypt
pkgver=1.8.2
vcs=git
gittag=libgcrypt-${pkgver}
extension=bz2
folder="ftp://ftp.gnupg.org/gcrypt/${pkgname}/"
check_server=1
relmon_id=1623

. ${UNDEAD_REPO}/defaults.sh

undead_make() {
    ./autogen.sh
    ./configure --disable-doc \
        --enable-maintainer-mode \
        --prefix=/usr \
        --build=x86_64-unknown-linux-gnu \
        --libdir=${LIBDIR}
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
