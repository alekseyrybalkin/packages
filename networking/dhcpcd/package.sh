#!/bin/sh

pkgname=dhcpcd
pkgver=6.11.5
vcs=git
gittag=dhcpcd-${pkgver}
extension=xz
folder="http://roy.marples.name/downloads/${pkgname}/"
check_server=1
relmon_id=11429

. ${KIIN_REPO}/defaults.sh

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

    sed -i "s;/var/lib;/run;g" dhcpcd-hooks/50-dhcpcd-compat
    install -v -m 644 dhcpcd-hooks/50-dhcpcd-compat ${pkgdir}/usr/lib/dhcpcd/dhcpcd-hooks/
    rm -r ${pkgdir}/run

    mv -v ${pkgdir}/etc/dhcpcd.conf{,.packaged}
}

known="etc/dhcpcd.duid"
