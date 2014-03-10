#!/bin/sh

pkgname=ruby
pkgver=2.1.1
_pkgver=2.1.1
urls="ftp://ftp.ruby-lang.org/pub/ruby/2.1/ruby-${_pkgver}.tar.bz2 \
  http://rybalkin.org/kiin-files/ruby-2.1.1-readline.patch"
srctar=${pkgname}-${_pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${_pkgver}

kiin_make() {
  patch -Np1 -i ${KIIN_HOME}/tarballs/ruby-2.1.1-readline.patch
  ./configure --prefix=/usr --enable-shared --disable-install-doc
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
