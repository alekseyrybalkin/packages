#!/bin/sh

pkgname=emacs
pkgver=24.5
vcs=git
gittag=emacs-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib \
        --localstatedir=/var \
        --with-x-toolkit=gtk3 \
        --with-xft
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    rm -rf ${pkgdir}/var
}
