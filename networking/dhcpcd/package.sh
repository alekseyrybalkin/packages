#!/bin/sh

pkgname=dhcpcd
pkgver=7.0.2
vcs=git
gittag=dhcpcd-${pkgver}
extension=xz
folder="http://roy.marples.name/downloads/${pkgname}/"
check_server=1
relmon_id=11429

. ${UNDEAD_REPO}/defaults.sh

undead_make() {
    ./configure --libexecdir=/usr/lib/dhcpcd \
        --dbdir=/run \
        --sbindir=/usr/bin \
        --sysconfdir=/etc
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
    mv ${pkgdir}/lib/dhcpcd/* ${pkgdir}/usr/lib/dhcpcd
    rm -rf ${pkgdir}/lib

    rm -r ${pkgdir}/run

    mv -v ${pkgdir}/etc/dhcpcd.conf{,.packaged}
}

known="etc/dhcpcd.duid"
