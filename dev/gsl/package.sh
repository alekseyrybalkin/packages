#!/bin/sh

pkgname=gsl
pkgver=2.1
vcs=git
gittag=release-${pkgver//\./-}
urls="http://ftp.gnu.org/pub/gnu/gsl/gsl-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh
    ./configure --prefix=/usr --disable-static \
        --enable-maintainer-mode
    make
    make html
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    mkdir -p ${pkgdir}/usr/share/doc/gsl
    cp doc/gsl-ref.html/* ${pkgdir}/usr/share/doc/gsl/
}
