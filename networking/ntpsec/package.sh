#!/bin/sh

pkgname=ntpsec
SKIP_ARCH_CHECK=1
pkgver=0.9.7
vcs=git
gittag=NTPsec_${pkgver//\./_}
srcdir=${location}/${pkgname}-${pkgver}
relmon_id=12837
relmon_sed='s/_/\./g'

kiin_make() {
    ./waf configure --prefix=/usr --sbindir=/usr/bin \
        --enable-seccomp --refclock=all
    ./waf build
}

kiin_install() {
    ./waf install --destdir=${pkgdir}
    mkdir ${pkgdir}/usr/share
    mv ${pkgdir}/usr/man ${pkgdir}/usr/share/
}
