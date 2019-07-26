#!/bin/sh

pkgname=popt
pkgver=1.17+
vcs=bzr
bzrrev=793
relmon_id=3689

build() {
    ./autogen.sh
    ./configure --prefix=/usr --disable-static
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
