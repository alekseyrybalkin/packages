#!/bin/sh

pkgname=gcc
pkgver=5.3.0
vcs=git
gittag=gcc_${pkgver//\./_}_release
urls="http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  # do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in
  mkdir -v gcc-build
  cd gcc-build
  ../configure --prefix=/usr \
    --libexecdir=/usr/lib \
    --libdir=/usr/lib \
    --enable-languages=c,c++ \
    --disable-multilib \
    --with-system-zlib
  make
  cd ../libstdc++-v3
  bash scripts/run_doxygen --mode=html --host_alias=x86_64-unknown-linux-gnu . . NO
}

kiin_install() {
  cd gcc-build
  make DESTDIR=${pkgdir} install
  cp ../libstdc++-v3/doc/doxygen/html/libstdc++.tag ${pkgdir}/usr/share/gcc-${pkgver}/
  ln -sv ../bin/cpp ${pkgdir}/usr/lib
  ln -sv gcc ${pkgdir}/usr/bin/cc
  mv ${pkgdir}/usr/lib64/* ${pkgdir}/usr/lib/
  rmdir ${pkgdir}/usr/lib64
  mkdir -pv ${pkgdir}/usr/share/gdb/auto-load/usr/lib
  mv -v ${pkgdir}/usr/lib/*gdb.py ${pkgdir}/usr/share/gdb/auto-load/usr/lib
}
