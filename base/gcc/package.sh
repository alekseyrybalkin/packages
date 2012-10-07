#!/bin/sh

pkgname=gcc
pkgver=4.7.2
urls="http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in
  sed -i -e /autogen/d -e /check.sh/d fixincludes/Makefile.in
  mkdir -v gcc-build
  cd gcc-build
  ../configure --prefix=/usr            \
                        --libexecdir=/usr/lib    \
                        --enable-shared          \
                        --enable-threads=posix   \
                        --enable-__cxa_atexit    \
                        --enable-clocale=gnu     \
                        --enable-languages=c,c++ \
                        --disable-multilib       \
                        --disable-bootstrap      \
                        --with-system-zlib
  make
}

kiin_install() {
  cd gcc-build
  make DESTDIR=${pkgdir} install
  mkdir ${pkgdir}/lib
  ln -sv ../usr/bin/cpp ${pkgdir}/lib
  ln -sv gcc ${pkgdir}/usr/bin/cc
  mkdir -pv ${pkgdir}/usr/share/gdb/auto-load/usr/lib
  mv -v ${pkgdir}/usr/lib64/*gdb.py ${pkgdir}/usr/share/gdb/auto-load/usr/lib
}
