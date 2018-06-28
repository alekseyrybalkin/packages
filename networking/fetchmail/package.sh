#!/bin/sh

pkgname=fetchmail
pkgver=6.3.26
vcs=git
gittag=RELEASE_${pkgver//\./-}
urls="http://downloads.sourceforge.net/fetchmail/fetchmail-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
relmon_id=801

undead_make() {
    patch -Np1 -i ../disable-sslv3.patch
    ./autogen.sh
    ./configure --prefix=/usr --with-ssl
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
