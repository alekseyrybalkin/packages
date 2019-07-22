#!/bin/sh

pkgname=automake
pkgver=1.16.1
vcs=git
gittag=v${pkgver}
relmon_id=144

kiin_make() {
    ./bootstrap
    ./configure --prefix=/usr --docdir=/usr/share/doc/${pkgname}
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
