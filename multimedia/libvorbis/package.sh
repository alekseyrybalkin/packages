#!/bin/sh

pkgname=libvorbis
pkgver=1.3.6
vcs=git
gittag=v${pkgver}
urls="http://downloads.xiph.org/releases/vorbis/${pkgname}-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
relmon_id=1758

undead_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --disable-static \
        --libdir=$LIBDIR
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
    mkdir -pv ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
    install -v -m644 doc/Vorbis* ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
}
