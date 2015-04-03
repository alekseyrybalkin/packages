#!/bin/sh

pkgname=groovy
pkgver=2.4.2
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
}

kiin_after_install() {
  chmod go-rwx /usr/bin/{grape,groovy,groovyConsole,groovyc,groovydoc,groovysh,java2groovy,startGroovy}
  getent group javer >/dev/null || groupadd javer
  getent passwd javer >/dev/null || \
    useradd -m -g javer -s /bin/bash javer
  chown javer:javer /usr/bin/{grape,groovy,groovyConsole,groovyc,groovydoc,groovysh,java2groovy,startGroovy}
}

kiin_after_upgrade() {
  kiin_after_install
}
