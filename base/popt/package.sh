#!/bin/sh

pkgname=popt
pkgver=1.17+
vcs=bzr
bzrrev=793
relmon_id=3689

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
