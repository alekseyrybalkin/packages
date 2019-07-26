#!/bin/sh

pkgname=file
pkgver=5.37
vcs=git
gittag=FILE${pkgver//\./_}
relmon_id=807

build() {
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
