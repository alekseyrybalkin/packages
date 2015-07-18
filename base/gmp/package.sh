#!/bin/sh

pkgname=gmp
pkgver=6.0.0+
vcs=mercurial
hgtag=b9a904a2a7a7
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
