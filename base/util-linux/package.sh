#!/bin/sh

pkgname=util-linux
pkgver=2.33.2
vcs=git
gittag=v${pkgver}
relmon_id=8179

kiin_make() {
    ./autogen.sh
    ./configure --bindir=/usr/bin \
        --libdir=/usr/lib \
        --with-python=3
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    mv ${pkgdir}/{sbin,usr/sbin}/* ${pkgdir}/usr/bin
    rmdir ${pkgdir}/{sbin,usr/sbin}
}
