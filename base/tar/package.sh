#!/bin/sh

pkgname=tar
vcs="git"
gittag=beca89bccb6b806e3528d4d0aa01cb5f2831c954
pkgver=1.26.20130312
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  echo "--gnulib-srcdir=$SOURCES_HOME/gnulib" > .bootstrap
  echo "--paxutils-srcdir=$SOURCES_HOME/paxutils" >> .bootstrap
  ./bootstrap
  ./configure --prefix=/usr --bindir=/bin --libexecdir=/usr/sbin
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  make DESTDIR=${pkgdir} -C doc install-html docdir=/usr/share/doc/tar
}
