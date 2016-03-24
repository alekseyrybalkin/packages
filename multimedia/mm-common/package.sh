#!/bin/sh

pkgname=mm-common
pkgver=0.9.10
vcs=git
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  tar xvf ${KIIN_HOME}/tarballs/gcc-5.3.0.tar.bz2
  cd gcc-5.3.0/libstdc++-v3
  bash scripts/run_doxygen --mode=html --host_alias=x86_64-unknown-linux-gnu . . NO
  cd ${srcdir}
  cp gcc-5.3.0/libstdc++-v3/doc/doxygen/html/libstdc++.tag doctags/
  rm -rf gcc-5.3.0
  ./autogen.sh --prefix=/usr --disable-network
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
}
