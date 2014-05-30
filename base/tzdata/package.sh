#!/bin/sh

pkgname=tzdata
pkgver=2014d
urls="http://www.iana.org/time-zones/repository/releases/${pkgname}${pkgver}.tar.gz"
_srctar=${pkgname}${pkgver}.tar.gz
_srcdir=${location}/${pkgname}${pkgver}

kiin_make() {
  mkdir ${_srcdir}
  tar xf ${KIIN_HOME}/tarballs/${_srctar} -C ${_srcdir}
  echo "nothing to make..."
}

kiin_install() {
  cd ${_srcdir}
  ZONEINFO=${pkgdir}/usr/share/zoneinfo
  mkdir -pv $ZONEINFO/{posix,right}
  for tz in etcetera southamerica northamerica europe africa antarctica  \
            asia australasia backward pacificnew \
            systemv; do
      /usr/sbin/zic -L /dev/null   -d $ZONEINFO       -y "sh yearistype.sh" ${tz}
      /usr/sbin/zic -L /dev/null   -d $ZONEINFO/posix -y "sh yearistype.sh" ${tz}
      /usr/sbin/zic -L leapseconds -d $ZONEINFO/right -y "sh yearistype.sh" ${tz}
  done
  cp -v zone.tab iso3166.tab $ZONEINFO
  /usr/sbin/zic -d $ZONEINFO -p America/New_York
  unset ZONEINFO

  mkdir ${pkgdir}/etc
  cp -v --remove-destination ${pkgdir}/usr/share/zoneinfo/Europe/Moscow \
      ${pkgdir}/etc/localtime
  cd ${location}
  rm -rf ${_srcdir}
}
