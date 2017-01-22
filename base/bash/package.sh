#!/bin/sh

pkgname=bash
pkgver=4.4.011
vcs=git
gittag=76bb456d8fcd870cd31b7bf9d90798cd97cee2ab
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
