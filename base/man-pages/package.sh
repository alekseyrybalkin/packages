#!/bin/sh

pkgname=man-pages
pkgver=5.01
vcs=git
gittag=man-pages-${pkgver}
relmon_id=1883

kiin_make() {
    :
}

kiin_install() {
    make prefix=${pkgdir}/usr install
    # these are included in shadow
    rm -f ${pkgdir}/usr/share/man/man5/passwd.5
    rm -f ${pkgdir}/usr/share/man/man3/getspnam.3
    rm -f ${pkgdir}/usr/share/man/man5/attr.5
}
