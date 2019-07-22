#!/bin/sh

pkgname=libvorbis
pkgver=1.3.6
vcs=git
gittag=v${pkgver}
relmon_id=1758

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --disable-static \
        --libdir=$LIBDIR
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    mkdir -pv ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
    install -v -m644 doc/Vorbis* ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
}
