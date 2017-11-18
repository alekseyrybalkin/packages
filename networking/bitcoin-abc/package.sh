#!/bin/sh

pkgname=bitcoin-abc
pkgver=0.16.1
vcs=git
gittag=v${pkgver}
relmon_id=13618

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --with-gui=no \
        --disable-zmq \
        --with-incompatible-bdb \
        --enable-hardening
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
