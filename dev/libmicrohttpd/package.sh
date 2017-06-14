#!/bin/sh

pkgname=libmicrohttpd
pkgver=0.9.55
vcs=git
gittag=v${pkgver}
relmon_id=1658

kiin_make() {
    ./bootstrap
    ./configure --prefix=/usr \
        --disable-dependency-tracking \
        --enable-largefile \
        --enable-curl \
        --enable-messages \
        --with-pic
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    install -Dm644 src/include/platform.h \
        ${pkgdir}/usr/include/${pkgname}/platform.h
    sed -i 's#Cflags: -I${includedir}#Cflags: -I${includedir} -I${includedir}/libmicrohttpd#' \
        ${pkgdir}/usr/lib/pkgconfig/libmicrohttpd.pc
}
