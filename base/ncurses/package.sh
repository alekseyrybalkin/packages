#!/bin/sh

pkgname=ncurses
pkgver=5.9
ARCH_VERSION=5.9_20141101
urls="ftp://ftp.gnu.org/gnu/ncurses/ncurses-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ../ncurses-${pkgver}-gcc5_buildfixes-1.patch
  mkdir ncurses{,w}-build

  cd ${srcdir}/ncursesw-build
  ../configure --prefix=/usr \
    --mandir=/usr/share/man \
    --with-shared \
    --with-normal \
    --without-debug \
    --without-ada \
    --enable-widec \
    --enable-pc-files \
    --with-pkg-config=/usr/bin/pkg-config \
    --libdir=${LIBDIR}
  make

  cd ${srcdir}/ncurses-build
  if [ -z "${KIIN_LIB32}" ]; then
    CONFIGFLAG="--with-chtype=long"
  fi
  ../configure --prefix=/usr \
    --mandir=/usr/share/man \
    --with-shared \
    --with-normal \
    --without-debug \
    --without-ada \
    ${CONFIGFLAG} \
    --libdir=${LIBDIR}
  make
}

kiin_install() {
  cd ${srcdir}/ncursesw-build
  make DESTDIR=${pkgdir} install
  if [ -z "$KIIN_LIB32" ]; then
    for lib in ncurses form panel menu; do
      echo "INPUT(-l${lib}w)" > ${pkgdir}/usr/lib/lib${lib}.so
    done

    for lib in ncurses ncurses++ form panel menu; do
      ln -s ${lib}w.pc ${pkgdir}/usr/lib/pkgconfig/${lib}.pc
    done

    # some packages look for -lcurses during build
    echo "INPUT(-lncursesw)" >${pkgdir}/usr/lib/libcursesw.so
    ln -s libncurses.so ${pkgdir}/usr/lib/libcurses.so

    cd ${srcdir}/ncurses-build
    for lib in ncurses form panel menu; do
      install -Dm755 lib/lib${lib}.so.${pkgver} ${pkgdir}/usr/lib/lib${lib}.so.${pkgver}
      ln -s lib${lib}.so.${pkgver} ${pkgdir}/usr/lib/lib${lib}.so.5
    done
  else
    install -dm755 ${pkgdir}/usr/lib32
    mv ${pkgdir}/usr/lib/pkgconfig ${pkgdir}/usr/lib32
    rm -rf ${pkgdir}/usr/lib

    # fool packages looking to link to non-wide-character ncurses libraries
    for lib in curses ncurses form panel menu; do
      rm -f ${pkgdir}/usr/lib32/lib${lib}.so
      echo "INPUT(-l${lib}w)" >${pkgdir}/usr/lib32/lib${lib}.so
      ln -sf lib${lib}w.a ${pkgdir}/usr/lib32/lib${lib}.a
    done
    ln -sf libncurses++w.a ${pkgdir}/usr/lib32/libncurses++.a

    for lib in ncurses ncurses++ form panel menu; do
      ln -s ${lib}w.pc ${pkgdir}/usr/lib32/pkgconfig/${lib}.pc
    done

    # some packages look for -lcurses during build
    rm -f ${pkgdir}/usr/lib32/libcursesw.so
    echo "INPUT(-lncursesw)" >${pkgdir}/usr/lib32/libcursesw.so
    ln -sf libncurses.so ${pkgdir}/usr/lib32/libcurses.so
    ln -sf libncursesw.a ${pkgdir}/usr/lib32/libcursesw.a
    ln -sf libncurses.a ${pkgdir}/usr/lib32/libcurses.a

    # non-widec compatibility libraries
    cd ${srcdir}/ncurses-build
    for lib in ncurses form panel menu; do
      install -Dm755 lib/lib${lib}.so.${pkgver} ${pkgdir}/usr/lib32/lib${lib}.so.${pkgver}
      ln -s lib${lib}.so.${pkgver} ${pkgdir}/usr/lib32/lib${lib}.so.5
    done
  fi
}
