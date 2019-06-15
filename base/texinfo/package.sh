#!/bin/sh

pkgname=texinfo
pkgver=6.6
vcs=git
gittag=texinfo-${pkgver}
relmon_id=4958

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}

known="usr/share/info/dir"
