#!/bin/sh

pkgname=libcap
pkgver=2.27
vcs=git
gittag=libcap-${pkgver}
relmon_id=1569

build() {
    sed -i '/install.*STALIBNAME/ s/^/#/' libcap/Makefile
    make
}

package() {
    make prefix=/usr lib=/lib DESTDIR=${pkgdir} RAISE_SETFCAP=no install
    chmod -v 755 ${pkgdir}/usr/lib/libcap.so
    mv ${pkgdir}/usr/{sbin,bin}
}
