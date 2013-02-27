#!/bin/sh

pkgname=tar
vcs="git"
gittag=17f99bc6f1405effe6cc31a60bb7353a033c13d6
pkgver=1.26.20130220
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../tar-build-fix.diff
  echo "--gnulib-srcdir=$SOURCES_HOME/gnulib" > .bootstrap
  echo "--paxutils-srcdir=$SOURCES_HOME/paxutils" >> .bootstrap
  ./bootstrap
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  make DESTDIR=${pkgdir} -C doc install-html docdir=/usr/share/doc/tar-${pkgver}
}
