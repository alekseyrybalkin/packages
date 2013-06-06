#!/bin/sh

pkgname=attr
pkgver=2.4.47
urls="http://download.savannah.gnu.org/releases/attr/attr-${pkgver}.src.tar.gz"
srctar=${pkgname}-${pkgver}.src.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e 's|/@pkg_name@|&-@pkg_version@|' include/builddefs.in
  INSTALL_USER=root  \
  INSTALL_GROUP=root \
  ./configure --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DIST_ROOT=${pkgdir} install install-dev install-lib
  chmod -v 755 ${pkgdir}/usr/lib/libattr.so.1.1.0
  mkdir -pv ${pkgdir}/lib
  mv -v ${pkgdir}/usr/lib/libattr.so.* ${pkgdir}/lib
  ln -sfv ../../lib/libattr.so.1 ${pkgdir}/usr/lib/libattr.so
  rm -rf ${pkgdir}/usr/share/man/man2
}
