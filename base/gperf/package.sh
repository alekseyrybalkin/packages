#!/bin/sh

pkgname=gperf
pkgver=3.0.4
vcs=git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr --docdir=/usr/share/doc/gperf
  echo -e "all:\n\ninstall:" > doc/Makefile
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
