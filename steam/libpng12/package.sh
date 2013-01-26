#!/bin/sh

pkgname=libpng12
pkgver=1.2.50
urls="http://sourceforge.net/projects/libpng/files/libpng-${pkgver}.tar.xz \
  http://sourceforge.net/projects/apng/files/libpng/libpng12/libpng-${pkgver}-apng.patch.gz"
srctar=libpng-${pkgver}.tar.xz
srcdir=${location}/libpng-${pkgver}

kiin_make() {
  patch -Np0 -i ../libpng-${pkgver}-apng.patch
  sed -i -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g' configure.ac
  libtoolize --force --copy
  aclocal
  autoconf
  automake --add-missing
  ./configure --prefix=/usr --libdir=$LIBDIR
  make ECHO=echo
}

kiin_install() {
  make ECHO=echo DESTDIR=${pkgdir} install

  if [ -z "$KIIN_LIB32" ]; then
    rm -rf ${pkgdir}/usr/share
    rm -rf ${pkgdir}/usr/bin/libpng-config
    rm -rf ${pkgdir}/usr/lib/{libpng.so,libpng.a}
    rm -rf ${pkgdir}/usr/lib/pkgconfig/libpng.pc
    rm -rf ${pkgdir}/usr/include/{pngconf.h,png.h}
  else
    rm -f ${pkgdir}/usr/lib32/{libpng.so,libpng.a,pkgconfig/libpng.pc}
  fi
}
