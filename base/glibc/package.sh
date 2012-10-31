#!/bin/sh

pkgname=glibc
pkgver=2.16.0
urls="http://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.xz \
  http://www.iana.org//time-zones/repository/releases/tzdata2012f.tar.gz \
  http://www.linuxfromscratch.org/patches/lfs/development/${pkgname}-${pkgver}-res_query_fix-1.patch \
  http://www.linuxfromscratch.org/patches/lfs/development/${pkgname}-${pkgver}-fix_test_installation-1.patch"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  sed -i 's#<rpc/types.h>#"rpc/types.h"#' sunrpc/rpc_clntout.c
  patch -Np1 -i ../glibc-2.16.0-fix_test_installation-1.patch
  sed -i 's|@BASH@|/bin/bash|' elf/ldd.bash.in
  patch -Np1 -i ../glibc-2.16.0-res_query_fix-1.patch
  mkdir -v glibc-build
  cd glibc-build
  ../configure  \
      --prefix=/usr          \
      --disable-profile      \
      --enable-add-ons       \
      --enable-kernel=2.6.25 \
      --enable-multi-arch    \
      --libexecdir=/usr/lib/glibc
  make
}

kiin_install() {
  cd glibc-build
  mkdir ${pkgdir}/etc
  make install_root=${pkgdir} install
  mkdir -pv ${pkgdir}/usr/include/{rpc,rpcsvc}
  cp -v ../sunrpc/rpc/*.h ${pkgdir}/usr/include/rpc
  cp -v ../sunrpc/rpcsvc/*.h ${pkgdir}/usr/include/rpcsvc
  cp -v ../nis/rpcsvc/*.h ${pkgdir}/usr/include/rpcsvc
  mkdir -pv ${pkgdir}/usr/lib/locale
  # after installation:
  #localedef -i en_US -f UTF-8 en_US.UTF-8

  tar -xf ../../tzdata2012f.tar.gz
  ZONEINFO=${pkgdir}/usr/share/zoneinfo
  mkdir -pv $ZONEINFO/{posix,right}
  for tz in etcetera southamerica northamerica europe africa antarctica  \
            asia australasia backward pacificnew solar87 solar88 solar89 \
            systemv; do
      /usr/sbin/zic -L /dev/null   -d $ZONEINFO       -y "sh yearistype.sh" ${tz}
      /usr/sbin/zic -L /dev/null   -d $ZONEINFO/posix -y "sh yearistype.sh" ${tz}
      /usr/sbin/zic -L leapseconds -d $ZONEINFO/right -y "sh yearistype.sh" ${tz}
  done
  cp -v zone.tab iso3166.tab $ZONEINFO
  /usr/sbin/zic -d $ZONEINFO -p America/New_York
  unset ZONEINFO

  cp -v --remove-destination ${pkgdir}/usr/share/zoneinfo/Europe/Moscow \
      ${pkgdir}/etc/localtime

  mkdir ${pkgdir}/etc/ld.so.conf.d
  # remove /var, filesystem package creates everything in there
  # TODO: decide with /var/db/Makefile
  rm -rvf ${pkgdir}/var
}
