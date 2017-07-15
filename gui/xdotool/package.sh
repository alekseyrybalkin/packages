#!/bin/sh

pkgname=xdotool
pkgver=3.20160805.1
vcs=git
gittag=v${pkgver}
relmon_id=8648
relmon_sed='s/v//g'

kiin_make() {
    make WITHOUT_RPATH_FIX=1
}

kiin_install() {
    make PREFIX=${pkgdir}/usr INSTALLMAN=${pkgdir}/usr/share/man install
    chmod -x ${pkgdir}/usr/include/xdo.h
}
