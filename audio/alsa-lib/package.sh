#!/bin/sh

pkgname=alsa-lib
pkgver=1.1.9
vcs=git
gittag=v${pkgver}
relmon_id=38

kiin_make() {
    autoreconf -fi
    ./configure --libdir=$LIBDIR --disable-python
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
