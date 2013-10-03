#!/bin/sh

pkgname=ideau
pkgver=12.1.5
_pkgver=129.1328
urls="http://download.jetbrains.com/idea/ideaIU-${pkgver}.tar.gz"
srctar=ideaIU-${pkgver}.tar.gz
srcdir=${location}/idea-IU-${_pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  mkdir -p ${pkgdir}/usr/share/idea
  cp -a ./* ${pkgdir}/usr/share/idea
  chown -R root:root ${pkgdir}/usr/share/idea
  sed -i '/.*read IGNORE.*/ d' ${pkgdir}/usr/share/idea/bin/idea.sh
  install -D -m755 ../idea.sh ${pkgdir}/usr/bin/idea
}
