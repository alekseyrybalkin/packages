#!/bin/sh

pkgname=dhcpcd
pkgver=7.2.2
vcs=git
gittag=dhcpcd-${pkgver}
relmon_id=11429

kiin_make() {
    ./configure --libexecdir=/usr/lib/dhcpcd \
        --dbdir=/run \
        --sbindir=/usr/bin \
        --sysconfdir=/etc
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    mv ${pkgdir}/lib/dhcpcd/* ${pkgdir}/usr/lib/dhcpcd
    rm -rf ${pkgdir}/lib

    rm -r ${pkgdir}/run

    mv -v ${pkgdir}/etc/dhcpcd.conf{,.packaged}
}
