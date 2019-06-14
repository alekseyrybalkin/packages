#!/bin/sh

pkgname=attr
pkgver=2.4.48
vcs=git
gittag=v${pkgver}
extension=gz
folder="http://download.savannah.gnu.org/releases/${pkgname}/"
check_server=1
relmon_id=137
relmon_sed='s/\.src//g'

srctar=${pkgname}-${pkgver}.src.tar.${extension}

. ${KIIN_REPO}/defaults.sh

ver_grep="^${pkgname}-.*\.src\.tar\.${extension}$"
ver_seds() {
    sed -r "s/^${pkgname}-//g" | sed -r "s/\.src\.tar\.${extension}$//g"
}

kiin_make() {
    sed -i -e 's/po//g' Makefile.am
    libtoolize -i
    autoreconf -f -i
    INSTALL_USER=root INSTALL_GROUP=root ./configure --prefix=/usr \
        --libdir=/usr/lib \
        --libexecdir=/usr/lib \
        --sysconfdir=/etc \
        --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
