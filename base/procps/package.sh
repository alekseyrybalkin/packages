#!/bin/sh

pkgname=procps
ARCH_NAME=procps-ng
pkgver=3.3.13
vcs=git
gittag=v${pkgver}
relmon_id=3708

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
