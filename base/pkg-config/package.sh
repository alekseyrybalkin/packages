#!/bin/sh

pkgname=pkg-config
vcs="git"
gittag=cf21a002be9ad42188c7d6e031a6a1eb36cd9b18
pkgver=0.28+
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e 's/AM_PROG_CC_STDC/AC_PROG_CC/g' configure.ac
  sed -i -e 's/AM_PROG_CC_STDC/AC_PROG_CC/g' glib/configure.ac
  ./autogen.sh
  ./configure --prefix=/usr         \
              --with-internal-glib  \
              --docdir=/usr/share/doc/${pkgname}-${pkgver} \
              --disable-host-tool
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
