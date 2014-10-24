#!/bin/sh

pkgname=jdk7
SKIP_ARCH_CHECK=1
pkgver=1.7.0_71
urls="somethere/jdk-7u71-linux-x64.tar.gz \
  somethere/tzupdater-1_4_8-2014h.zip"
srctar=jdk-7u71-linux-x64.tar.gz
srcdir=${location}/jdk${pkgver}

kiin_make() {
  unzip ${KIIN_HOME}/tarballs/tzupdater-1_4_8-2014h.zip
  cd tzupdater-1.4.8-2014h
  export J2SDKDIR=${srcdir}
  export J2REDIR=${srcdir}/jre
  export JAVA_HOME=${srcdir}
  export PATH=${JAVA_HOME}/bin:${JAVA_HOME}/jre/bin:${PATH}
  java -jar tzupdater.jar -V
  java -jar tzupdater.jar -u
  java -jar tzupdater.jar -V
  cd ../
  rm -rf tzupdater-1.4.8-2014h jre/lib/zi.tzdata2014c
}

kiin_install() {
  mkdir -p ${pkgdir}/opt/${pkgname}-${pkgver}
  cp -r ./* ${pkgdir}/opt/${pkgname}-${pkgver}
  ln -sv ${pkgname}-${pkgver} ${pkgdir}/opt/jdk
}
