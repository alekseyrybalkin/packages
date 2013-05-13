#!/bin/sh

pkgname=idea
pkgver=12.1.3
_pkgver=129.451
urls="http://download.jetbrains.com/idea/ideaIC-${pkgver}.tar.gz"
srctar=ideaIC-${pkgver}.tar.gz
srcdir=${location}/idea-IC-${_pkgver}

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
