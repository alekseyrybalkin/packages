#!/bin/sh

pkgname=proxychains
pkgver=3.1
urls="http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i 's/servlen, unsigned int/servlen, int/' proxychains/libproxychains.c
  sed -i -e 's/4\.2\.2\.2/8\.8\.8\.8/g' proxychains/proxyresolv
  sed -i -e 's/dig\ $1\ @$DNS_SERVER\ +tcp/drill\ $1\ @$DNS_SERVER -t/g' proxychains/proxyresolv
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mv ${pkgdir}/usr/etc ${pkgdir}
}
