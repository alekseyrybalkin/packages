#!/bin/sh

KIIN_NON_FREE=1 # downloads 388 jars into ~/.m2
pkgname=maven
pkgver=3.3.9
vcs=git
gittag=maven-${pkgver}
urls="http://apache-mirror.rbc.ru/pub/apache/maven/maven-3/${pkgver}/binaries/apache-maven-${pkgver}-bin.tar.gz"
srctar=apache-maven-${pkgver}-bin.tar.gz
srcdir=${location}/apache-maven-${pkgver}

kiin_make() {
    export PATH=${PATH}:/usr/lib/openjdk/bin:/usr/lib/apache-ant/bin
    export JAVA_HOME=/usr/lib/openjdk
    ant -Dmaven.home="${srcdir}/bundle"
    echo "nothing to make..."
}

kiin_install() {
    mkdir -p ${pkgdir}/usr/lib
    cp -r ./bundle ${pkgdir}/usr/lib/maven
    mv ${pkgdir}/usr/lib/maven/conf/settings.xml{,.packaged}
}
