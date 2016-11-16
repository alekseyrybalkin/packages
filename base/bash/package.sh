#!/bin/sh

pkgname=bash
pkgver=4.4.005
vcs=git
gittag=f459cbd8be37b28be1dc90315e0ab51d7f211301
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./configure --prefix=/usr \
        --htmldir=/usr/share/doc/bash \
        --without-bash-malloc \
        --with-installed-readline
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    ln -sv bash ${pkgdir}/usr/bin/sh
}
