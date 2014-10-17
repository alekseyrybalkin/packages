#!/bin/sh

pkgname=ideau
ARCH_NAME=intellij-idea-community-edition
SKIP_ARCH_CHECK=1
pkgver=13.1.5
_pkgver=135.1289
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
