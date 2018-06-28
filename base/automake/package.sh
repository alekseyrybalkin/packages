#!/bin/sh

pkgname=automake
pkgver=1.16.1
vcs=git
gittag=v${pkgver}
extension=xz
folder="http://ftp.gnu.org/gnu/${pkgname}/"
check_server=1
relmon_id=144

. ${UNDEAD_REPO}/defaults.sh

undead_make() {
    ./bootstrap
    ./configure --prefix=/usr --docdir=/usr/share/doc/${pkgname}
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
