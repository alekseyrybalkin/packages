#!/bin/sh

#vcs=none
pkgname=lzo
pkgver=2.10
urls="http://www.oberhumer.com/opensource/${pkgname}/download/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
relmon_id=1868

kiin_make() {
    ./configure --prefix=/usr \
        --enable-shared \
        --build=x86_64-unknown-linux-gnu \
        --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
