#!/bin/sh

pkgname=libxml
ARCH_NAME=libxml2
pkgver=2.9.9
vcs=git
vcs_pkgname=libxml2
gittag=v${pkgver}
relmon_id=1783

kiin_make() {
    ./autogen.sh --prefix=/usr \
        --disable-static \
        --with-history \
        --with-python="no"
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
