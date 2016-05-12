#!/bin/sh

pkgname=fetchmail
pkgver=6.3.26
vcs=git
gittag=RELEASE_${pkgver//\./-}
urls="http://downloads.sourceforge.net/fetchmail/fetchmail-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr --with-ssl --enable-fallback=procmail
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
