#!/bin/sh

pkgname=apache-ant
pkgver=1.10.1
vcs=git
gittag=rel/${pkgver}
extension=bz2
folder="http://archive.apache.org/dist/ant/source/"
check_server=1
srctar=${pkgname}-${pkgver}-src.tar.${extension}
relmon_id=50

. ${UNDEAD_REPO}/defaults.sh

ver_grep="^${pkgname}-.*-src\.tar\.${extension}$"
ver_seds() {
    sed -r "s/^${pkgname}-//g" | sed -r "s/-src\.tar\.${extension}$//g"
}

undead_make() {
    sed -i 's;jars,test-jar;jars;' build.xml
}

undead_install() {
    export PATH=${PATH}:/usr/lib/openjdk/bin
    export JAVA_HOME=/usr/lib/openjdk
    ./build.sh -Ddist.dir=${pkgdir}/usr/lib/apache-ant dist
}
