#!/bin/sh

pkgname=libatomic_ops
pkgver=7.4.2
vcs=git
gittag=libatomic_ops-${pkgver//\./_}
urls="http://www.ivmaisoft.com/_bin/atomic_ops/libatomic_ops-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    sed -i 's#pkgdata#doc#' doc/Makefile.am
    ./autogen.sh
    ./configure --prefix=/usr \
        --enable-shared \
        --disable-static \
        --docdir=/usr/share/doc/libatomic_ops
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    mv -v ${pkgdir}/usr/share/libatomic_ops/* ${pkgdir}/usr/share/doc/libatomic_ops
    rm -vrf ${pkgdir}/usr/share/libatomic_ops
}
