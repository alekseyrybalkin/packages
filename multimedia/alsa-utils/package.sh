#!/bin/sh

pkgname=alsa-utils
pkgver=1.1.3
vcs=git
gittag=v${pkgver}
relmon_id=37

kiin_make() {
    autoreconf -fi
    ./configure --disable-alsaconf --disable-xmlto --disable-bat \
        --without-systemdsystemunitdir --sbindir=/usr/bin \
        --with-udev-rules-dir=/usr/lib/udev/rules.d
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    # remove /var, filesystem package creates everything in there
    rm -rvf ${pkgdir}/var
}
