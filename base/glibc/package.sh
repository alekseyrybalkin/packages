#!/bin/sh

pkgname=glibc
pkgver=2.16.0
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
      --libexecdir=/usr/lib/glibc
  make
}

kiin_install() {
  cd glibc-build
  mkdir ${pkgdir}/etc
  touch ${pkgdir}/etc/ld.so.conf
  make install_root=${pkgdir} install
  mkdir -pv ${pkgdir}/usr/include/{rpc,rpcsvc}
  cp -v ../sunrpc/rpc/*.h ${pkgdir}/usr/include/rpc
  cp -v ../sunrpc/rpcsvc/*.h ${pkgdir}/usr/include/rpcsvc
  cp -v ../nis/rpcsvc/*.h ${pkgdir}/usr/include/rpcsvc
  mkdir -pv ${pkgdir}/usr/lib/locale
  #localedef -i cs_CZ -f UTF-8 cs_CZ.UTF-8
  #localedef -i de_DE -f ISO-8859-1 de_DE
  #localedef -i de_DE@euro -f ISO-8859-15 de_DE@euro
  #localedef -i de_DE -f UTF-8 de_DE.UTF-8
  #localedef -i en_GB -f UTF-8 en_GB.UTF-8
  #localedef -i en_HK -f ISO-8859-1 en_HK
  #localedef -i en_PH -f ISO-8859-1 en_PH
  #localedef -i en_US -f ISO-8859-1 en_US
  #localedef -i en_US -f UTF-8 en_US.UTF-8
  #localedef -i es_MX -f ISO-8859-1 es_MX
  #localedef -i fa_IR -f UTF-8 fa_IR
  #localedef -i fr_FR -f ISO-8859-1 fr_FR
  #localedef -i fr_FR@euro -f ISO-8859-15 fr_FR@euro
  #localedef -i fr_FR -f UTF-8 fr_FR.UTF-8
  #localedef -i it_IT -f ISO-8859-1 it_IT
  #localedef -i it_IT -f UTF-8 it_IT.UTF-8
  #localedef -i ja_JP -f EUC-JP ja_JP
  #localedef -i ru_RU -f KOI8-R ru_RU.KOI8-R
  #localedef -i ru_RU -f UTF-8 ru_RU.UTF-8
  #localedef -i tr_TR -f UTF-8 tr_TR.UTF-8
  #localedef -i zh_CN -f GB18030 zh_CN.GB18030

  cat > ${pkgdir}/etc/nsswitch.conf << "EOF"
# Begin /etc/nsswitch.conf

passwd: files
group: files
shadow: files

hosts: files dns
networks: files

protocols: files
services: files
ethers: files
rpc: files

# End /etc/nsswitch.conf
EOF

  tar -xf ../../tzdata2012e.tar.gz
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

  cat > ${pkgdir}/etc/ld.so.conf << "EOF"
# Begin /etc/ld.so.conf
/usr/local/lib
/opt/lib
EOF

  cat >> ${pkgdir}/etc/ld.so.conf << "EOF"
# Add an include directory
include /etc/ld.so.conf.d/*.conf
EOF
  mkdir ${pkgdir}/etc/ld.so.conf.d
  # remove /var, filesystem package creates everything in there
  # TODO: decide with /var/db/Makefile
  rm -rvf ${pkgdir}/var
}
