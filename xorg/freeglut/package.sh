#!/bin/sh

pkgname=freeglut
ARCH_NAME_LIB32=freeglut
pkgver=3.0.0
vcs=git-svn
git_pkgname=freeglut-git-svn
svnrev=1752
urls="http://downloads.sourceforge.net/freeglut/freeglut-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
}

kiin_install() {
  cd build
  make DESTDIR=${pkgdir} install
}
