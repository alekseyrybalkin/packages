#!/bin/sh

KIIN_NON_FREE=1 # because binary
pkgname=groovy
pkgver=2.4.3
urls="http://dl.bintray.com/groovy/maven/${pkgname}-binary-${pkgver}.zip"
srczip=${pkgname}-binary-${pkgver}.zip
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  for f in bin/*; do
    sed 's:bin/sh:bin/sh\nGROOVY_HOME=/usr/share/groovy:' -i "${f}"
  done

  cd embeddable
  ln -s groovy-all-${pkgver}.jar groovy-all.jar
  cd ..
}

kiin_install() {
  install -d ${pkgdir}/usr/share/groovy ${pkgdir}/usr/bin
  cp -r lib conf embeddable ${pkgdir}/usr/share/groovy
  cp bin/* ${pkgdir}/usr/bin
  find ${pkgdir} -name '*.bat' -exec rm {} \;

  chmod o-rwx,g-w ${pkgdir}/usr/bin/*
  chown root:javer ${pkgdir}/usr/bin/*
}
