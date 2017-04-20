#!/bin/sh

pkgname=cargo
pkgver=0.17.0
vcs=git
gittag=${pkgver}
relmon_id=7892

kiin_make() {
    export CARGO_HOME=${KIIN_HOME}/tarballs/cargo
    git clone ${SOURCES_HOME}/rust-installer src/rust-installer
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --cargo=/usr/bin/cargo
    make
}

kiin_install() {
    export CARGO_HOME=${KIIN_HOME}/tarballs/cargo
    make DESTDIR=${pkgdir} install
    rm -rf ${pkgdir}/usr/etc/
    rm -rf ${pkgdir}/usr/lib/rustlib/{install.log,manifest-cargo,uninstall.sh}
}
