#!/bin/sh

# TODO: build from sources
KIIN_NON_FREE=1
pkgname=intellij-idea
SKIP_ARCH_CHECK=1
pkgver=2016.1
_pkgver=145.258.11
urls="http://download.jetbrains.com/idea/ideaIC-${pkgver}.tar.gz"
srctar=ideaIC-${pkgver}.tar.gz
srcdir=${location}/idea-IC-${_pkgver}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  mkdir -p ${pkgdir}/usr/lib/intellij-idea
  cp -a ./* ${pkgdir}/usr/lib/intellij-idea
  chown -R root:root ${pkgdir}/usr/lib/intellij-idea
  install -D -m755 ../idea.sh ${pkgdir}/usr/bin/intellij-idea
}
