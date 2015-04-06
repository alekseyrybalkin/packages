#!/bin/sh

pkgname=llvm
pkgver=3.6.0
urls="http://llvm.org/releases/${pkgver}/llvm-${pkgver}.src.tar.xz \
  http://llvm.org/releases/${pkgver}/cfe-${pkgver}.src.tar.xz \
  http://llvm.org/releases/${pkgver}/compiler-rt-${pkgver}.src.tar.xz"
srctar=${pkgname}-${pkgver}.src.tar.xz
srcdir=${location}/${pkgname}-${pkgver}.src

kiin_make() {
  tar -xf ${KIIN_HOME}/tarballs/cfe-${pkgver}.src.tar.xz -C tools
  tar -xf ${KIIN_HOME}/tarballs/compiler-rt-${pkgver}.src.tar.xz -C projects
  mv tools/cfe-${pkgver}.src tools/clang
  mv projects/compiler-rt-${pkgver}.src projects/compiler-rt
  CC=gcc CXX=g++ \
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --enable-libffi \
    --enable-optimized \
    --enable-shared \
    --disable-assertions
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  for file in ${pkgdir}/usr/lib/lib{clang,LLVM,LTO}*.a; do
    test -f $file && chmod -v 644 $file
  done
  rm -rf ${pkgdir}/usr/docs

  install -v -dm755 ${pkgdir}/usr/lib/clang-analyzer
  for prog in scan-build scan-view; do
    cp -rfv tools/clang/tools/${prog} ${pkgdir}/usr/lib/clang-analyzer/
    ln -sfv ../lib/clang-analyzer/${prog}/${prog} ${pkgdir}/usr/bin/
  done

  ln -sfv /usr/bin/clang ${pkgdir}/usr/lib/clang-analyzer/scan-build/
  mv -v ${pkgdir}/usr/lib/clang-analyzer/scan-build/scan-build.1 ${pkgdir}/usr/share/man/man1/
}
