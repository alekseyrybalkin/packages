#!/bin/sh

pkgname=physlock
SKIP_ARCH_CHEK=1
pkgver=0.5
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    make PREFIX=/usr
}

kiin_install() {
    make DESTDIR=${pkgdir} PREFIX=/usr install
}