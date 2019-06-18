#!/bin/sh

pkgname=slang
majorver=2.3
pkgver=${majorver}.2
vcs=git
gittag=v${pkgver}
extension=bz2
folder="http://www.jedsoft.org/releases/slang/"
check_server=1
relmon_id=4829

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    MAKEFLAGS=
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --build=x86_64-unknown-linux-gnu \
        --without-png
    make
}

kiin_install() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install-all
}
