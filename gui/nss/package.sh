#!/bin/sh

pkgname=nss
pkgver=3.15.3.1
patchver=3.15.3.1
urls="http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_15_3_1_RTM/src/nss-${pkgver}.tar.gz \
  http://www.linuxfromscratch.org/patches/blfs/svn/nss-${patchver}-standalone-1.patch"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  MAKEFLAGS=
  patch -Np1 -i ../nss-${patchver}-standalone-1.patch
  cd nss
  make BUILD_OPT=1 \
    NSPR_INCLUDE_DIR=/usr/include/nspr \
    USE_SYSTEM_ZLIB=1 \
    ZLIB_LIBS=-lz \
    $([ -z "$KIIN_LIB32" ] && echo USE_64=1) \
    $([ -f /usr/include/sqlite3.h ] && echo NSS_USE_SYSTEM_SQLITE=1)
}

kiin_install() {
  MAKEFLAGS=
  LIB=lib
  if [ -n "$KIIN_LIB32" ]; then
    LIB=lib32
  fi
  cd dist
  mkdir -p ${pkgdir}/usr/$LIB/pkgconfig
  mkdir -p ${pkgdir}/usr/bin
  install -v -m755 Linux*/lib/*.so ${pkgdir}/usr/$LIB
  install -v -m644 Linux*/lib/{*.chk,libcrmf.a} ${pkgdir}/usr/$LIB
  install -v -m755 -d ${pkgdir}/usr/include/nss
  cp -v -RL {public,private}/nss/* ${pkgdir}/usr/include/nss
  chmod 644 ${pkgdir}/usr/include/nss/*
  install -v -m755 Linux*/bin/{certutil,nss-config,pk12util} ${pkgdir}/usr/bin
  install -v -m644 Linux*/lib/pkgconfig/nss.pc ${pkgdir}/usr/$LIB/pkgconfig
}
