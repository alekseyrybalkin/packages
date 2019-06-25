#!/bin/sh

pkgname=device-mapper
ARCH_NAME=lvm2
pkgver=2.03.05
vcs=git
vcs_pkgname=lvm2
gittag=v${pkgver//\./_}
relmon_id=5354

kiin_make() {
    unset LDFLAGS
    ./configure --prefix=/ --sbindir=/usr/bin --sysconfdir=/etc \
        --localstatedir=/var --datarootdir=/usr/share \
        --includedir=/usr/include --with-usrlibdir=/usr/lib \
        --libdir=/usr/lib --enable-pkgconfig --enable-readline
    make
}

kiin_install() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install_device-mapper
}
