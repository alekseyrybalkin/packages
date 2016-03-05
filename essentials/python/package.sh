#!/bin/sh

pkgname=python
_pybasever=3.5
pkgver=${_pybasever}.1
extension=xz
folder="https://www.python.org/ftp/${pkgname}/"
check_server=1

srctar=Python-${pkgver}.tar.${extension}
srcdir=${location}/Python-${pkgver}

. ${KIIN_REPO}/defaults.sh

urls="${folder}${pkgver}/${srctar}"
ver_grep="^3\.[0-9]+\.[0-9]+/$"
ver_seds() {
  sed -r "s/\///g"
}

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
  make DESTDIR=${pkgdir} install
  ln -s python3               ${pkgdir}/usr/bin/python
  ln -s python3-config        ${pkgdir}/usr/bin/python-config
  ln -s idle3                 ${pkgdir}/usr/bin/idle
  ln -s pydoc3                ${pkgdir}/usr/bin/pydoc
  ln -s python${pkgver} ${pkgdir}/usr/share/man/man1/python.1
}
