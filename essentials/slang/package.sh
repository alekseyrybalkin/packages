#!/bin/sh

pkgname=slang
majorver=2.3
pkgver=${majorver}.1a
vcs=git
# FIXME
gittag=339b3c13282c6b336eb57178aeff9c9ba00a2887
extension=bz2
folder="http://www.jedsoft.org/releases/slang/"
check_server=1
relmon_id=4829

. ${UNDEAD_REPO}/defaults.sh

undead_make() {
    MAKEFLAGS=
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --build=x86_64-unknown-linux-gnu \
        --without-png
    make
}

undead_install() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install-all
}
