#!/bin/sh

pkgname=ncurses
pkgver=5.9
urls="ftp://ftp.gnu.org/gnu/ncurses/ncurses-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../ncurses-${pkgver}-gcc5_buildfixes-1.patch
  sed -i '/LIBTOOL_INSTALL/d' c++/Makefile.in

  ./configure --prefix=/usr \
    --mandir=/usr/share/man \
    --with-shared \
    --without-debug \
    --without-normal \
    --enable-pc-files \
    --enable-widec
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  for lib in ncurses form panel menu; do
    echo "INPUT(-l${lib}w)" > ${pkgdir}/usr/lib/lib${lib}.so
    ln -s ${lib}w.pc ${pkgdir}/usr/lib/pkgconfig/${lib}.pc
  done

  # some packages look for -lcurses during build
  echo "INPUT(-lncursesw)" > ${pkgdir}/usr/lib/libcursesw.so
  ln -s libncurses.so ${pkgdir}/usr/lib/libcurses.so

  mkdir -pv ${pkgdir}/usr/share/doc/ncurses
  cp -v -R doc/* ${pkgdir}/usr/share/doc/ncurses
}
