#!/bin/sh

pkgname=ruby
pkgver=2.0.0.p247
_pkgver=2.0.0-p247
urls="ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-${_pkgver}.tar.bz2"
srctar=${pkgname}-${_pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${_pkgver}

kiin_make() {
  ./configure --prefix=/usr --enable-shared --disable-install-doc
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
