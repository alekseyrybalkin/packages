#!/bin/sh

pkgname=bash
pkgver=4.3.046
vcs=git
gittag=30a978b7d808c067219c95be88c4979b6a7aa251
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
