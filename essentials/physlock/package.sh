#!/bin/sh

pkgname=physlock
SKIP_ARCH_CHECK=1
pkgver=0.5
vcs=git
gittag=v${pkgver}

undead_make() {
    make PREFIX=/usr
}

undead_install() {
    make DESTDIR=${pkgdir} PREFIX=/usr install
}
