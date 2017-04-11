#!/bin/sh

pkgname=bitcoin
pkgver=0.14.0
vcs=git
vcs_clone="git clone https://github.com/bitcoin/bitcoin.git"
gittag=v${pkgver}

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
