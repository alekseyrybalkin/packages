#!/bin/sh

pkgname=fluxbox
pkgver=1.3.7
vcs=git
gittag=Release-${pkgver//\./_}
relmon_id=824

build() {
    ./autogen.sh
    ./configure --prefix=/usr --disable-imlib2
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
