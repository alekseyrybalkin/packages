#!/bin/sh

pkgname=libmad
pkgver=0.15.1b
urls="http://downloads.sourceforge.net/mad/libmad-${pkgver}.tar.gz \
  http://www.linuxfromscratch.org/patches/blfs/svn/libmad-${pkgver}-fixes-1.patch"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ${KIIN_HOME}/tarballs/libmad-0.15.1b-fixes-1.patch
  sed "s@AM_CONFIG_HEADER@AC_CONFIG_HEADERS@g" -i configure.ac
  touch NEWS AUTHORS ChangeLog
  autoreconf -fi
  ./configure --prefix=/usr --disable-static
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -p ${pkgdir}/usr/lib/pkgconfig
  cp ../mad.pc ${pkgdir}/usr/lib/pkgconfig/
  sed -i -e "s/KIIN_LIBMAD_VERSION/${pkgver}/g" ${pkgdir}/usr/lib/pkgconfig/mad.pc
}
