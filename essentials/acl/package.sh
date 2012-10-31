#!/bin/sh

pkgname=acl
pkgver=2.2.51
urls="http://download.savannah.gnu.org/releases/acl/acl-${pkgver}.src.tar.gz"
srctar=${pkgname}-${pkgver}.src.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i -e 's|/@pkg_name@|&-@pkg_version@|' \
    include/builddefs.in

  INSTALL_USER=root  \
  INSTALL_GROUP=root \
  ./configure --prefix=/usr --libdir=/lib --libexecdir=/usr/lib
  make
}

kiin_install() {
  make DIST_ROOT=${pkgdir} install install-dev install-lib
  chmod -v 0755 ${pkgdir}/lib/libacl.so.1.1.0
  rm -v ${pkgdir}/lib/libacl.{a,la,so}
  mkdir -p ${pkgdir}/usr/lib
  ln -sfv ../../lib/libacl.so.1 ${pkgdir}/usr/lib/libacl.so
  sed -i "s|libdir='/lib'|libdir='/usr/lib'|" ${pkgdir}/usr/lib/libacl.la
  mkdir -p ${pkgdir}/usr/share/doc/acl-2.2.51
  install -v -m644 doc/*.txt ${pkgdir}/usr/share/doc/acl-2.2.51
}
