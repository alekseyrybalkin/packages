#!/bin/sh

pkgname=libidn
pkgver=2.1.1
vcs=git
vcs_pkgname=libidn2
gittag=libidn2-${pkgver}
relmon_id=5597

kiin_make() {
    git clone -s ${SOURCES_HOME}/dev/gnulib
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu \
        --disable-doc \
        --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
