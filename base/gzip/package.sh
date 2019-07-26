#!/bin/sh

pkgname=gzip
pkgver=1.10
vcs=git
gittag=v${pkgver}
relmon_id=1290

build() {
    git clone -s `find_vcs_repo gnulib`
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu
    make
}

package() {
    make prefix=${pkgdir} install
    mkdir -pv ${pkgdir}/usr/bin
    mv -v ${pkgdir}/bin/* ${pkgdir}/usr/bin
    rm -rf ${pkgdir}/bin
    mv -v ${pkgdir}/share ${pkgdir}/usr
}
