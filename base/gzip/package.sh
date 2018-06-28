#!/bin/sh

pkgname=gzip
pkgver=1.9
vcs=git
gittag=v${pkgver}
relmon_id=1290

undead_make() {
    export CFLAGS="${CFALGS} -Wimplicit-fallthrough=0"
    git clone -s ${UNDEAD_HOME}/sources/gnulib
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu
    make
}

undead_install() {
    make prefix=${pkgdir} install
    mkdir -pv ${pkgdir}/usr/bin
    mv -v ${pkgdir}/bin/* ${pkgdir}/usr/bin
    rm -rf ${pkgdir}/bin
    mv -v ${pkgdir}/share ${pkgdir}/usr
}
