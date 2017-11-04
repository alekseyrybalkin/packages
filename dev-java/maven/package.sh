#!/bin/sh

KIIN_NON_FREE=1 # because binary
#vcs=git
pkgname=maven
pkgver=3.5.2
urls="http://apache-mirror.rbc.ru/pub/apache/maven/maven-3/${pkgver}/binaries/apache-maven-${pkgver}-bin.tar.gz"
srctar=apache-maven-${pkgver}-bin.tar.gz
srcdir=${location}/apache-maven-${pkgver}
relmon_id=13532

kiin_make() {
    :
}

kiin_install() {
    mkdir -p ${pkgdir}/usr/lib
    cp -r . ${pkgdir}/usr/lib/maven
    mv ${pkgdir}/usr/lib/maven/conf/settings.xml{,.packaged}
}
