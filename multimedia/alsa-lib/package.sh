#!/bin/sh

pkgname=alsa-lib
pkgver=1.1.6
vcs=git
gittag=v${pkgver}
relmon_id=38

undead_make() {
    autoreconf -fi
    ./configure --libdir=$LIBDIR --disable-python
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
