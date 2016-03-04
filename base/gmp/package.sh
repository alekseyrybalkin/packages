#!/bin/sh

pkgname=gmp
pkgver=6.1.0
vcs=mercurial
hgtag=gmp-${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./.bootstrap
  ./configure --prefix=/usr \
    --enable-cxx \
    --disable-static \
    --docdir=/usr/share/doc/gmp
  make
  make html
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  make DESTDIR=${pkgdir} install-html
}
