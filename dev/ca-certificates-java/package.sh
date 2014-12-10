#!/bin/sh

KIIN_NON_FREE=1
pkgname=ca-certificates-java
pkgver=20140324
extension=xz
folder="http://ftp.debian.org/debian/pool/main/c/${pkgname}/"
check_server=1

srctar=${pkgname}_${pkgver}.tar.${extension}

. ${KIIN_REPO}/defaults.sh

ver_grep="^${pkgname}_.*\.tar\.${extension}$"
ver_seds() {
  sed -r "s/^${pkgname}_//g" | sed -r "s/\.tar\.${extension}$//g"
}

kiin_make() {
  mkdir m2_repo
  mvn package -Dmaven.repo.local=m2_repo -Dmaven.test.skip=true
}

kiin_install() {
  install -d -m755 ${pkgdir}/etc/ssl/certs/java
  install -D -m600 debian/default ${pkgdir}/etc/default/cacerts
  install -D -m644 target/ca-certificates-java-${pkgver}.jar ${pkgdir}/usr/share/ca-certificates-java/ca-certificates-java.jar
  install -D -m755 ../init-jks-keystore ${pkgdir}/usr/bin/init-jks-keystore
  install -D -m755 ../jks-keystore.hook ${pkgdir}/etc/ca-certificates/update.d/jks-keystore
}

kiin_after_install() {
  if [ ! -f /etc/ssl/certs/java/cacerts ]; then
    if which java >/dev/null 2>&1; then
      /usr/bin/init-jks-keystore
    fi
  fi
}

kiin_after_upgrade() {
  kiin_after_install
}

known="etc/ssl/certs/java/cacerts"
