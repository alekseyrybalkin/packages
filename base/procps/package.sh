#!/bin/sh

pkgname=procps
ARCH_NAME=procps-ng
pkgver=3.3.11
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh
    ./configure --exec-prefix=/ \
        --prefix=/usr \
        --libdir=/usr/lib \
        --bindir=/usr/bin \
        --sbindir=/usr/bin \
        --mandir=/usr/share/man \
        --docdir=/usr/share/doc/${pkgname} \
        --disable-static \
        --disable-kill
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
