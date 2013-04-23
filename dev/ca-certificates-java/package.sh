#!/bin/sh

pkgname=ca-certificates-java
pkgver=20121112+nmu2
urls="http://ftp.debian.org/debian/pool/main/c/${pkgname}/${pkgname}_${pkgver}.tar.gz"
srctar=${pkgname}_${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  javac -target 1.6 -source 1.6 UpdateCertificates.java
  jar cfe ca-certificates-java.jar UpdateCertificates *.class
}

kiin_install() {
  install -d -m755 ${pkgdir}/etc/ssl/certs/java
  install -D -m600 debian/default ${pkgdir}/etc/default/cacerts
  install -D -m644 ca-certificates-java.jar ${pkgdir}/usr/share/ca-certificates-java/ca-certificates-java.jar
  install -D -m755 ../init-jks-keystore ${pkgdir}/usr/sbin/init-jks-keystore
  install -D -m755 ../jks-keystore.hook ${pkgdir}/etc/ca-certificates/update.d/jks-keystore
}

kiin_after_install() {
  if [ ! -f /etc/ssl/certs/java/cacerts ]; then
    if which java >/dev/null 2>&1; then
      /usr/sbin/init-jks-keystore
    fi
  fi
}

kiin_after_upgrade() {
  kiin_after_install
}
