#!/bin/sh

pkgname=pkg-config
pkgver=0.29.2
vcs=git
gittag=pkg-config-${pkgver}
relmon_id=3649

undead_make() {
    rm -rf glib
    mkdir glib
    ./autogen.sh --prefix=/usr \
        --with-internal-glib=no \
        --docdir=/usr/share/doc/${pkgname} \
        --disable-host-tool
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
