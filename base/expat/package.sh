#!/bin/sh

pkgname=expat
pkgver=2.2.7
vcs=git
vcs_pkgname=libexpat
gittag=R_${pkgver//\./_}
relmon_id=770

kiin_make() {
    cd expat
    ./buildconf.sh
    ./configure --prefix=/usr --disable-static --without-xmlwf
    make
}

kiin_install() {
    cd expat
    make DESTDIR=${pkgdir} install
    install -v -m755 -d ${pkgdir}/usr/share/doc/expat
    install -v -m644 doc/*.{html,png,css} ${pkgdir}/usr/share/doc/expat
}
