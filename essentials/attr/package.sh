#!/bin/sh

pkgname=attr
pkgver=2.4.46
urls="http://download.savannah.gnu.org/releases/attr/attr-${pkgver}.src.tar.gz"
srctar=${pkgname}-${pkgver}.src.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e 's|/@pkg_name@|&-@pkg_version@|' include/builddefs.in
  INSTALL_USER=root  \
  INSTALL_GROUP=root \
  ./configure --prefix=/usr --libdir=/lib --libexecdir=/usr/lib \
    --disable-static
  make
}

kiin_install() {
  make DIST_ROOT=${pkgdir} install install-dev install-lib
  chmod -v 0755 ${pkgdir}/lib/libattr.so.1.1.0
  rm -v ${pkgdir}/lib/libattr.{a,la,so}
  sed -i 's@/lib@/usr/lib@' ${pkgdir}/usr/lib/libattr.la
  ln -sfv ../../lib/libattr.so.1 ${pkgdir}/usr/lib/libattr.so
  rm -rf ${pkgdir}/usr/share/man/man2
}
