#!/bin/sh

pkgname=gcc
pkgver=4.9.0
urls="http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2 \
  http://www.linuxfromscratch.org/patches/lfs/development/gcc-${pkgver}-upstream_fixes-1.patch"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  patch -Np1 -i ${KIIN_HOME}/tarballs/gcc-${pkgver}-upstream_fixes-1.patch
  sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64
  # do not use AVX
  sed -i -e 's/#ifndef HAVE_AS_AVX/#if !defined(HAVE_AS_AVX) || !defined(__AVX__)/g' libitm/config/x86/x86_avx.cc
  sed -i -e 's/#ifdef HAVE_AS_AVX/#if defined(HAVE_AS_AVX) \&\& defined(__AVX__)/g' libitm/config/x86/x86_avx.cc
  # do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in
  mkdir -v gcc-build
  cd gcc-build
  SED=sed ../configure --prefix=/usr \
    --libexecdir=/usr/lib \
    --libdir=/usr/lib \
    --enable-shared \
    --enable-threads=posix \
    --enable-__cxa_atexit \
    --enable-clocale=gnu \
    --enable-languages=c,c++ \
    --enable-multilib \
    --disable-bootstrap \
    --with-system-zlib
  make
}

kiin_install() {
  cd gcc-build
  make DESTDIR=${pkgdir} install
  ln -sv ../bin/cpp ${pkgdir}/usr/lib
  ln -sv gcc ${pkgdir}/usr/bin/cc
  mkdir -pv ${pkgdir}/usr/share/gdb/auto-load/usr/lib
  mv -v ${pkgdir}/usr/lib/*gdb.py ${pkgdir}/usr/share/gdb/auto-load/usr/lib
  rm -v ${pkgdir}/usr/lib32/*gdb.py
}
