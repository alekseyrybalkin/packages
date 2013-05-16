#!/bin/sh

pkgname=groovy
vcs="git"
gittag=e0fcf892053773267e243c87de254d722cae915f
pkgver=2.1.3+
_pkgver=2.2.0-SNAPSHOT
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  ./gradlew clean dist
}

kiin_install() {
  unzip target/distributions/groovy-binary-${_pkgver}.zip
  cd groovy-${_pkgver}
  cd embeddable
  mv ${pkgname}-all-${_pkgver}-indy.jar ${pkgname}-all-${_pkgver}.jar
  ln -s ${pkgname}-all-${_pkgver}.jar ${pkgname}-all.jar
  for f in ../bin/*; do
    sed 's:bin/sh:bin/sh\nGROOVY_HOME=/usr/share/groovy:' -i $f
  done
  mkdir -p ${pkgdir}/usr/share/groovy ${pkgdir}/usr/bin
  cd ../indy
  for i in *.jar; do
    j=`echo $i | sed 's/-indy//g'`
    cp $i ../lib/$j
  done
  cd ..
  cp -r lib ${pkgdir}/usr/share/groovy
  cp -r conf ${pkgdir}/usr/share/groovy
  cp -r embeddable ${pkgdir}/usr/share/groovy
  cp bin/* ${pkgdir}/usr/bin
  find ${pkgdir} -name '*.bat' -exec rm {} \;
}
