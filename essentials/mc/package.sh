#!/bin/sh

pkgname=mc
pkgver=4.8.23
vcs=git
gittag=${pkgver}
extension=xz
folder="http://ftp.midnight-commander.org/"
check_server=1
relmon_id=1954

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --libexecdir=/usr/lib \
        --enable-charset \
        --disable-static \
        --sysconfdir=/etc \
        --with-screen=slang
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    rm ${pkgdir}/usr/share/mc/skins/xoria256.ini
}
