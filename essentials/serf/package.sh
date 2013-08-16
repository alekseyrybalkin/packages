#!/bin/sh

pkgname=serf
pkgver=1.3.1
urls="https://serf.googlecode.com/files/serf-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i "/incdir/s:MAJOR':&\n\nenv\['SHLIBVERSION'\]='0.\${MAJOR}.0':" SConstruct
  sed -i "/Append/s:RPATH=libdir,::" SConstruct
  sed -i "/Default/s:lib_static,::" SConstruct
  sed -i "/Alias/s:install_static,::" SConstruct
  scons PREFIX=/usr
}

kiin_install() {
  mkdir -p ${pkgdir}/usr
  scons PREFIX=${pkgdir}/usr install
  ln -sfv libserf-1.so.3.0.0 ${pkgdir}/usr/lib/libserf-1.so
}
