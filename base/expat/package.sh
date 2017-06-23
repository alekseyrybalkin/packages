#!/bin/sh

pkgname=expat
pkgver=2.2.1
vcs=git
gittag=R_${pkgver//\./_}
urls="http://downloads.sourceforge.net/expat/expat-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
relmon_id=770

kiin_make() {
    cd expat
    sed -i -e 's/$(MAKE) -C doc xmlwf.1/touch doc\/xmlwf.1/g' Makefile.in
    ./buildconf.sh
    ./configure --prefix=/usr --disable-static
    make
}

kiin_install() {
    cd expat
    make DESTDIR=${pkgdir} install
    install -v -m755 -d ${pkgdir}/usr/share/doc/expat
    install -v -m644 doc/*.{html,png,css} ${pkgdir}/usr/share/doc/expat
}
