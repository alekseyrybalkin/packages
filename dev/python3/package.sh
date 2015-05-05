#!/bin/sh

pkgname=python3
ARCH_NAME=python
pkgver=3.4.3
vcs=mercurial
hg_repo=https://hg.python.org/cpython
hg_pkgname=cpython
hgtag=v${pkgver}
srcdir=${location}/Python-${pkgver}
extra_urls="http://docs.python.org/3/archives/python-${pkgver}-docs-html.tar.bz2"

kiin_make() {
  MAKEFLAGS=
  rm -r Modules/expat
  rm -r Modules/zlib
  rm -r Modules/_ctypes/{darwin,libffi}*
  CXX="/usr/bin/g++" \
  ./configure --prefix=/usr \
    --enable-shared \
    --with-system-expat \
    --with-system-ffi \
    --without-ensurepip
  make
}

kiin_install() {
  MAKEFLAGS=
  mkdir -p ${pkgdir}/usr/lib/pkgconfig
  make DESTDIR=${pkgdir} install
  mv ${pkgdir}/usr/bin/2to3{,-3}
  install -v -dm755 ${pkgdir}/usr/share/doc/python3/html
  tar --strip-components=1 \
    --no-same-owner \
    --no-same-permissions \
    -C ${pkgdir}/usr/share/doc/python3/html \
    -xvf ${KIIN_HOME}/tarballs/python-${pkgver}-docs-html.tar.bz2
}
