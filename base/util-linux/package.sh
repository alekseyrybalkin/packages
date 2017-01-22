#!/bin/sh

pkgname=util-linux
pkgver=2.29.1
vcs=git
#FIXME gittag=v${pkgver}
gittag=9ebc8a7a882ddfd93bc3262514791a0dcaadba09
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
