#!/bin/sh

pkgname=pinentry
pkgver=1.0.0
vcs=git
gittag=pinentry-${pkgver}
extension=bz2
folder="ftp://ftp.gnupg.org/gcrypt/pinentry/"
relmon_id=3643

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --enable-pinentry-gtk2=no \
        --enable-pinentry-gnome3=no \
        --enable-maintainer-mode
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
