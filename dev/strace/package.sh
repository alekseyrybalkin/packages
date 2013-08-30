#!/bin/sh

pkgname=strace
vcs="git"
gittag=v4.8
pkgver=4.8
srcdir=${location}/${pkgname}-${pkgver}
urls="http://www.linuxfromscratch.org/patches/downloads/strace/strace-${pkgver}-glibc_2.18_build_fix-1.patch"

kiin_make() {
  patch -Np1 -i ../strace-${pkgver}-glibc_2.18_build_fix-1.patch
  sed -i -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g' configure.ac
  autoreconf -i -f
  ./configure --prefix=/usr
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
