#!/bin/sh

#vcs=subversion
pkgname=serf
pkgver=1.3.8
_sover=1.3.0
urls="https://archive.apache.org/dist/serf/serf-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i "/Append/s:RPATH=libdir,::" SConstruct
  sed -i "/Default/s:lib_static,::" SConstruct
  sed -i "/Alias/s:install_static,::" SConstruct
  scons PREFIX=/usr
}

kiin_install() {
  mkdir -p ${pkgdir}/usr
  scons PREFIX=${pkgdir}/usr install
  ln -sfv libserf-1.so.${_sover} ${pkgdir}/usr/lib/libserf-1.so
}
