#!/bin/sh

pkgname=attr
pkgver=2.4.47
extension=gz
folder="http://download.savannah.gnu.org/releases/${pkgname}/"
check_server=1

srctar=${pkgname}-${pkgver}.src.tar.${extension}

. ${KIIN_HOME}/defaults.sh

ver_grep="^${pkgname}-.*\.src\.tar.${extension}$"
ver_seds() {
  sed -r "s/^${pkgname}-//g" | sed -r "s/\.src\.tar.${extension}$//g"
}

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
