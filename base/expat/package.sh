#!/bin/sh

pkgname=expat
pkgver=2.2.5
vcs=git
gittag=R_${pkgver//\./_}
urls="http://downloads.sourceforge.net/expat/expat-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
relmon_id=770

undead_make() {
    cd expat
    ./buildconf.sh
    ./configure --prefix=/usr --disable-static --without-xmlwf
    make
}

undead_install() {
    cd expat
    make DESTDIR=${pkgdir} install
    install -v -m755 -d ${pkgdir}/usr/share/doc/expat
    install -v -m644 doc/*.{html,png,css} ${pkgdir}/usr/share/doc/expat
}
