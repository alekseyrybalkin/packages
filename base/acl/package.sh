#!/bin/sh

pkgname=acl
pkgver=2.2.53
vcs=git
gittag=v${pkgver}
extension=gz
folder="http://download.savannah.gnu.org/releases/${pkgname}/"
check_server=1
relmon_id=16
relmon_sed='s/\.src//g'

srctar=${pkgname}-${pkgver}.src.tar.${extension}

. ${KIIN_REPO}/defaults.sh

ver_grep="^${pkgname}-.*\.src\.tar\.${extension}$"
ver_seds() {
    sed -r "s/^${pkgname}-//g" | sed -r "s/\.src\.tar\.${extension}$//g"
}

kiin_make() {
    sed -i -e 's/po//g' Makefile.am
    sed -i -e "/TABS-1;/a if (x > (TABS-1)) x = (TABS-1);" \
        libacl/__acl_to_any_text.c
    libtoolize -i
    autoreconf -f -i
    INSTALL_USER=root INSTALL_GROUP=root ./configure --prefix=/usr \
        --libdir=/usr/lib \
        --sysconfdir=/etc \
        --bindir=/usr/bin \
        --disable-static \
        --libexecdir=/usr/lib
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
