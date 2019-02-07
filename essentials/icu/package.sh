#!/bin/sh

pkgname=icu
pkgver=63.1
vcs=git
gittag=release-${pkgver//\./-}

kiin_make() {
    cd icu4c/source
    # glibc 2.26 fix
    sed -i 's/xlocale/locale/' i18n/digitlst.cpp
    ./configure --prefix=/usr --sbindir=/usr/bin
    make
}

kiin_install() {
    cd icu4c/source
    make DESTDIR=${pkgdir} install
}
