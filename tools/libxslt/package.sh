#!/bin/sh

pkgname=libxslt
pkgver=1.1.33
vcs=git
gittag=v${pkgver}
relmon_id=13301

build() {
    ./autogen.sh --prefix=/usr \
        --disable-static \
        --with-python=/usr/bin/python
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
