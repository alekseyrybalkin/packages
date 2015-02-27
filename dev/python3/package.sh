#!/bin/sh

pkgname=python3
ARCH_NAME=python
pkgver=3.4.3
_docs_ver=3.4.2
urls="http://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz \
  http://docs.python.org/3/archives/python-${_docs_ver}-docs-html.tar.bz2"
srctar=Python-${pkgver}.tar.xz
srcdir=${location}/Python-${pkgver}

kiin_make() {
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
  mkdir -p ${pkgdir}/usr/lib/pkgconfig
  make DESTDIR=${pkgdir} install
  mv ${pkgdir}/usr/bin/2to3{,-3}
  install -v -dm755 ${pkgdir}/usr/share/doc/python3/html
  tar --strip-components=1 \
    --no-same-owner \
    --no-same-permissions \
    -C ${pkgdir}/usr/share/doc/python3/html \
    -xvf ${KIIN_HOME}/tarballs/python-${_docs_ver}-docs-html.tar.bz2
}
