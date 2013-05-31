#!/bin/sh

pkgname=ncurses
pkgver=5.9
urls="ftp://ftp.gnu.org/gnu/ncurses/ncurses-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./configure --prefix=/usr \
    --mandir=/usr/share/man \
    --with-shared \
    --without-debug \
    --enable-pc-files \
    --enable-widec \
    --with-install-prefix=${pkgdir} \
    --libdir=$LIBDIR
  make
}

kiin_install() {
  make install
  if [ -z "$KIIN_LIB32" ]; then
    mkdir -pv ${pkgdir}/lib
    mv -v ${pkgdir}/usr/lib/libncursesw.so.5* ${pkgdir}/lib
    ln -sfv ../../lib/libncursesw.so.5 ${pkgdir}/usr/lib/libncursesw.so
    for lib in ncurses form panel menu ; do
      rm -vf ${pkgdir}/usr/lib/lib${lib}.so
      echo "INPUT(-l${lib}w)" > ${pkgdir}/usr/lib/lib${lib}.so
      ln -sfv lib${lib}w.a ${pkgdir}/usr/lib/lib${lib}.a
      ln -svf ${lib}w.pc ${pkgdir}/usr/lib/pkgconfig/${lib}.pc
    done
    ln -sfv libncurses++w.a ${pkgdir}/usr/lib/libncurses++.a
    rm -vf ${pkgdir}/usr/lib/libcursesw.so
    echo "INPUT(-lncursesw)" > ${pkgdir}/usr/lib/libcursesw.so
    ln -sfv libncurses.so ${pkgdir}/usr/lib/libcurses.so
    ln -sfv libncursesw.a ${pkgdir}/usr/lib/libcursesw.a
    ln -sfv libncurses.a ${pkgdir}/usr/lib/libcurses.a
    mkdir -pv      ${pkgdir}/usr/share/doc/ncurses-${pkgver}
    cp -v -R doc/* ${pkgdir}/usr/share/doc/ncurses-${pkgver}
  else
    mv ${pkgdir}/usr/lib/pkgconfig ${pkgdir}/usr/lib32
    rm -rf ${pkgdir}/usr/lib
    for lib in ncurses form panel menu ; do
      rm -vf ${pkgdir}/usr/lib32/lib${lib}.so
      echo "INPUT(-l${lib}w)" > ${pkgdir}/usr/lib32/lib${lib}.so
      ln -sfv lib${lib}w.a ${pkgdir}/usr/lib32/lib${lib}.a
      ln -svf ${lib}w.pc ${pkgdir}/usr/lib32/pkgconfig/${lib}.pc
    done
    ln -sv libncursesw.so.5 ${pkgdir}/usr/lib32/libncurses.so.5
  fi
}
