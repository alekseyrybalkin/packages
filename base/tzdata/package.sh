#!/bin/sh

#vcs=none
pkgname=tzdata
pkgver=2019a
urls="http://www.iana.org/time-zones/repository/releases/${pkgname}${pkgver}.tar.gz"
_srctar=${pkgname}${pkgver}.tar.gz
_srcdir=${location}/${pkgname}${pkgver}
relmon_id=5021

kiin_make() {
    mkdir ${_srcdir}
    tar xf ${SOURCES_HOME}/tarballs/${_srctar} -C ${_srcdir}
}

kiin_install() {
    cd ${_srcdir}
    ZONEINFO=${pkgdir}/usr/share/zoneinfo
    mkdir -pv $ZONEINFO/{posix,right}
    for tz in etcetera southamerica northamerica europe africa antarctica  \
        asia australasia backward pacificnew systemv; do
        zic -L /dev/null   -d $ZONEINFO       ${tz}
        zic -L /dev/null   -d $ZONEINFO/posix ${tz}
        zic -L leapseconds -d $ZONEINFO/right ${tz}
    done
    cp -v zone.tab zone1970.tab iso3166.tab $ZONEINFO
    zic -d $ZONEINFO -p America/New_York
    unset ZONEINFO

    cd ${location}
    rm -rf ${_srcdir}
}
