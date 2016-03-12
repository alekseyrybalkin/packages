#!/bin/sh

pkgname=expat
pkgver=2.1.1
#vcs=git
#gittag=R_${pkgver//\./_}
# git build needs sgml2xml
urls="http://downloads.sourceforge.net/expat/expat-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  #cd expat
  #./buildconf.sh
  ./configure --prefix=/usr --disable-static
  make
}

kiin_install() {
  #cd expat
  make DESTDIR=${pkgdir} install
  install -v -m755 -d ${pkgdir}/usr/share/doc/expat
  install -v -m644 doc/*.{html,png,css} ${pkgdir}/usr/share/doc/expat
}
