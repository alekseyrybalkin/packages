#!/bin/sh

KIIN_NON_FREE=1 # because binary
pkgname=grails
pkgver=2.4.4
urls="http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/${pkgname}-${pkgver}.zip"
srczip=${pkgname}-${pkgver}.zip
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  install -d ${pkgdir}/usr/share
  cp -r . ${pkgdir}/usr/share/grails

  install -Dm755 bin/startGrails \
    ${pkgdir}/usr/share/grails/startGrails
  install -Dm755 ../grails.sh \
    ${pkgdir}/usr/bin/grails
  install -Dm755 ../grails.sh \
    ${pkgdir}/usr/share/grails/bin/grails

  # clean up
  cd ${pkgdir}/usr/share/grails
  rm -rf doc INSTALL LICENSE README
  find ${pkgdir}/usr/share -name "*.bat" -exec rm {} \;
}

kiin_after_install() {
  chmod go-rwx /usr/bin/grails \
    /usr/share/grails/bin/grails \
    /usr/share/grails/{,bin/}startGrails
  getent group javer >/dev/null || groupadd javer
  getent passwd javer >/dev/null || \
    useradd -m -g javer -s /bin/bash javer
  chown javer:javer /usr/bin/grails \
    /usr/share/grails/bin/grails \
    /usr/share/grails/{,bin/}startGrails
}

kiin_after_upgrade() {
  kiin_after_install
}
