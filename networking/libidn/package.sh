#!/bin/sh

pkgname=libidn
pkgver=2.0.4
vcs=git
vcs_pkgname=libidn2
gittag=libidn2-${pkgver}
relmon_id=5597

undead_make() {
    git clone -s ${UNDEAD_HOME}/sources/gnulib
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu \
        --disable-doc \
        --disable-static
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
