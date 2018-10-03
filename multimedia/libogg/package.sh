#!/bin/sh

pkgname=libogg
pkgver=1.3.3
vcs=git
gittag=v${pkgver}
extension=xz
folder="http://downloads.xiph.org/releases/ogg/"
check_server=1
relmon_id=1694

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr --disable-static --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
