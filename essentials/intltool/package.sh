#!/bin/sh

pkgname=intltool
pkgver=0.50.2
urls="http://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  install -v -m644 -D doc/I18N-HOWTO \
    ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/I18N-HOWTO
}
