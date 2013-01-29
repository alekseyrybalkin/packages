#!/bin/sh

pkgname=pkg-config
vcs="git"
gittag=74ceac54ef6f9247c00f08eecd8cca811a3c5934
pkgver=0.28.20130124
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
