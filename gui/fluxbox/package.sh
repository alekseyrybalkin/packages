#!/bin/sh

pkgname=fluxbox
pkgver=1.3.7
vcs=git
gittag=Release-${pkgver//\./_}
relmon_id=824

kiin_make() {
    patch -Np1 -i ../configpath.diff
    ./autogen.sh
    ./configure --prefix=/usr --disable-imlib2
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
