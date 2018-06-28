#!/bin/sh

pkgname=m4
pkgver=1.4.18
vcs=git
gittag=v${pkgver}
relmon_id=1871

undead_make() {
    export CFLAGS="${CFALGS} -Wimplicit-fallthrough=0"
    git clone -s ${UNDEAD_HOME}/sources/gnulib
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu
    make
}

undead_install() {
    make prefix=${pkgdir}/usr install
}
