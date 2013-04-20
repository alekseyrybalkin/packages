#!/bin/sh

pkgname=groovy
pkgver=2.1.3
urls="http://dist.groovy.codehaus.org/distributions/${pkgname}-binary-${pkgver}.zip"
srczip=${pkgname}-binary-${pkgver}.zip
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  cd embeddable
  ln -s "${pkgname}-all-${pkgver}.jar" "${pkgname}-all.jar"
  for f in ../bin/*; do
    sed 's:bin/sh:bin/sh\nGROOVY_HOME=/usr/share/groovy:' -i $f
  done
  cd ..
}

kiin_install() {
  mkdir -p ${pkgdir}/usr/share/groovy ${pkgdir}/usr/bin
  cp -r lib ${pkgdir}/usr/share/groovy
  cp -r conf ${pkgdir}/usr/share/groovy
  cp -r embeddable ${pkgdir}/usr/share/groovy
  cp bin/* ${pkgdir}/usr/bin
  find ${pkgdir} -name '*.bat' -exec rm {} \;
}
