#!/bin/sh

pkgname=autoconf
pkgver=2.69
vcs=git
gittag=v${pkgver}
extension=xz
folder="http://ftp.gnu.org/gnu/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

ver_grep="^${pkgname}-[0-9\.]*\.tar\.${extension}$"

kiin_make() {
    git cherry-pick a357718b081f1678748ead5d7cb67c766c930441
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
