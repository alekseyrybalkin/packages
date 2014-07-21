#!/bin/sh

pkgname=lapack
pkgver=3.5.0
urls="http://www.netlib.org/lapack/${pkgname}-${pkgver}.tgz"
srctar=${pkgname}-${pkgver}.tgz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  install -d build
  cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_Fortran_COMPILER=gfortran \
    -DLAPACKE=ON
  make
}

kiin_install() {
  # lapack
  install -m755 -d ${pkgdir}/usr/{lib,bin,include}

  for libname in liblapack libtmglib liblapacke; do
    install -m755 "${srcdir}/build/lib/${libname}.so" \
      "${pkgdir}/usr/lib/"
    ln -sf ${libname}.so "${pkgdir}/usr/lib/${libname}.so.${pkgver}"
    ln -sf ${libname}.so "${pkgdir}/usr/lib/${libname}.so.3"
  done

  install -m755 "${srcdir}"/build/bin/* "${pkgdir}/usr/bin"
  install -m644 "${srcdir}"/build/include/* "${pkgdir}/usr/include"

  # blas
  install -m755 -d "${pkgdir}/usr/lib"
  install -m755 "${srcdir}/build/lib/libblas.so" \
      "${pkgdir}/usr/lib/"
  ln -sf libblas.so "${pkgdir}/usr/lib/libblas.so.${pkgver}"
  ln -sf libblas.so "${pkgdir}/usr/lib/libblas.so.3"
}
