#!/bin/sh

pkgname=gzip
pkgver=1.9
vcs=git
gittag=v${pkgver}
relmon_id=1290

kiin_make() {
    export CFLAGS="${CFALGS} -Wimplicit-fallthrough=0"
    git clone -s ${SOURCES_HOME}/dev/gnulib
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu
    make
}

kiin_install() {
    make prefix=${pkgdir} install
    mkdir -pv ${pkgdir}/usr/bin
    mv -v ${pkgdir}/bin/* ${pkgdir}/usr/bin
    rm -rf ${pkgdir}/bin
    mv -v ${pkgdir}/share ${pkgdir}/usr
}
