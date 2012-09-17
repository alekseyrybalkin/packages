#!/bin/sh

pkgname=gcc
pkgver=4.7.1
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
  #mkdir ${pkgdir}/usr/lib
  #ln -sv lib ${pkgdir}/usr/lib64
  make DESTDIR=${pkgdir} install
  mv -v ${pkgdir}/usr/lib64/* ${pkgdir}/usr/lib
  rm -r ${pkgdir}/usr/lib64
  ln -sv lib ${pkgdir}/usr/lib64
  mkdir ${pkgdir}/lib
  ln -sv ../usr/bin/cpp ${pkgdir}/lib
  ln -sv gcc ${pkgdir}/usr/bin/cc
  mkdir -pv ${pkgdir}/usr/share/gdb/auto-load/usr/lib
  mv -v ${pkgdir}/usr/lib/*gdb.py ${pkgdir}/usr/share/gdb/auto-load/usr/lib
}
