#!/bin/sh

pkgname=mc
pkgver=4.8.20
vcs=git
gittag=${pkgver}
extension=xz
folder="http://ftp.midnight-commander.org/"
check_server=1
relmon_id=1954

. ${UNDEAD_REPO}/defaults.sh

undead_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --libexecdir=/usr/lib \
        --enable-charset \
        --disable-static \
        --sysconfdir=/etc \
        --with-screen=slang
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
