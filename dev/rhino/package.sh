#!/bin/sh

pkgname=rhino
vcs="git"
gittag=5f1ad11dfbf23b3afcc8caa6c230fa3533b5ffd6
pkgver=1.7R4+
xmlbeans_ver=2.5.0
urls="http://archive.apache.org/dist/xmlbeans/binaries/xmlbeans-${xmlbeans_ver}.tgz"
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  tar xvf ${KIIN_HOME}/tarballs/xmlbeans-${xmlbeans_ver}.tgz
  ant -Dxbean.jar=xmlbeans-${xmlbeans_ver}/lib/xbean.jar \
    -Djsr173.jar=xmlbeans-${xmlbeans_ver}/lib/jsr173_1.0_api.jar \
    jar
}

kiin_install() {
  install -Dm644 build/rhino1_7R5pre/js.jar ${pkgdir}/usr/share/java/js-${pkgver}.jar
  ln -s js-${pkgver}.jar ${pkgdir}/usr/share/java/js.jar
}
