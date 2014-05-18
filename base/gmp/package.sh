#!/bin/sh

pkgname=gmp
pkgver=6.0.0
urls="ftp://ftp.gmplib.org/pub/gmp-${pkgver}/gmp-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  if [ -z "${KIIN_LIB32}" ]; then
    ./configure --prefix=/usr --enable-cxx --libdir=${LIBDIR}
  else
    export ABI=32
    ./configure --prefix=/usr --enable-cxx --libdir=${LIBDIR} \
      --includedir=/usr/lib32/gmp
    sed -i 's/$(exec_prefix)\/include/$\(includedir\)/' Makefile
  fi
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}/usr/share/doc/gmp-${pkgver}
  cp    -v doc/{isa_abi_headache,configuration} doc/*.html \
          ${pkgdir}/usr/share/doc/gmp-${pkgver}
}
