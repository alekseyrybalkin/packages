#!/bin/sh

pkgname=util-linux
pkgver=2.29
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh
    ./configure --without-udev \
        --bindir=/usr/bin \
        --libdir=/usr/lib \
        --without-python \
        ADJTIME_PATH=/var/lib/hwclock/adjtime
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    mv ${pkgdir}/{sbin,usr/sbin}/* ${pkgdir}/usr/bin
    rmdir ${pkgdir}/{sbin,usr/sbin}
}
