pkgname=dhcpcd
pkgver=8.0.2
vcs=git
gittag=dhcpcd-${pkgver}
relmon_id=11429

build() {
    ./configure --libexecdir=/usr/lib/dhcpcd \
        --dbdir=/run \
        --sbindir=/usr/bin \
        --sysconfdir=/etc
    make
}

package() {
    make DESTDIR=${pkgdir} install
    mv ${pkgdir}/lib/dhcpcd/* ${pkgdir}/usr/lib/dhcpcd
    rm -rf ${pkgdir}/lib

    rm -r ${pkgdir}/run

    mv -v ${pkgdir}/etc/dhcpcd.conf{,.packaged}
}
