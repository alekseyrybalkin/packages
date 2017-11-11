#!/bin/sh

pkgname=bitcoin
pkgver=0.15.1
vcs=git
vcs_clone="git clone https://github.com/bitcoin/bitcoin.git"
gittag=v${pkgver}
relmon_id=13618

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr \
        --with-gui=no \
        --disable-zmq \
        --with-incompatible-bdb
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
