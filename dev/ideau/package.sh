#!/bin/sh

KIIN_NON_FREE=1
pkgname=ideau
ARCH_NAME=intellij-idea-community-edition
SKIP_ARCH_CHECK=1
pkgver=13.1.6
_pkgver=135.1306
urls="http://download.jetbrains.com/idea/ideaIU-${pkgver}.tar.gz"
srctar=ideaIU-${pkgver}.tar.gz
srcdir=${location}/idea-IU-${_pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  mkdir -p ${pkgdir}/usr/share/ideau
  cp -a ./* ${pkgdir}/usr/share/ideau
  chown -R root:root ${pkgdir}/usr/share/ideau
  sed -i '/.*read IGNORE.*/ d' ${pkgdir}/usr/share/ideau/bin/idea.sh
  install -D -m755 ../idea.sh ${pkgdir}/usr/bin/ideau
}

kiin_after_install() {
  chmod 700 /usr/bin/ideau
  getent group javer >/dev/null || groupadd javer
  getent passwd javer >/dev/null || \
    useradd -m -g javer -s /bin/bash javer
  chown javer:javer /usr/bin/ideau
}

kiin_after_upgrade() {
  kiin_after_install
}
