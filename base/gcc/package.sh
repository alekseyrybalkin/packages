#!/bin/sh

pkgname=gcc
pkgver=4.8.2
urls="http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  # --disable-install-libiberty does not work as of now
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in
  # do not use AVX
  sed -i -e 's/#ifndef HAVE_AS_AVX/#if !defined(HAVE_AS_AVX) || !defined(__AVX__)/g' libitm/config/x86/x86_avx.cc
  sed -i -e 's/#ifdef HAVE_AS_AVX/#if defined(HAVE_AS_AVX) \&\& defined(__AVX__)/g' libitm/config/x86/x86_avx.cc
  mkdir -v gcc-build
  cd gcc-build
  ../configure --prefix=/usr \
    --libexecdir=/usr/lib \
    --enable-shared \
    --enable-threads=posix \
    --enable-__cxa_atexit \
    --enable-clocale=gnu \
    --enable-languages=c,c++ \
    --enable-multilib \
    --disable-bootstrap \
    --disable-install-libiberty \
    --with-system-zlib
  make
}

kiin_install() {
  cd gcc-build
  make DESTDIR=${pkgdir} install
  ln -sv ../bin/cpp ${pkgdir}/usr/lib
  ln -sv gcc ${pkgdir}/usr/bin/cc
  mkdir -pv ${pkgdir}/usr/share/gdb/auto-load/usr/lib
  mv -v ${pkgdir}/usr/lib64/*gdb.py ${pkgdir}/usr/share/gdb/auto-load/usr/lib
  rm -v ${pkgdir}/usr/lib32/*gdb.py
}
