#!/bin/sh

pkgname=netbeans
pkgver=8.0.1
_subver=201408251540
SKIP_ARCH_CHECK=1
urls="http://dlc.sun.com.edgesuite.net/${pkgname}/${pkgver}/final/zip/${pkgname}-${pkgver}-${_subver}.zip"
srczip=${pkgname}-${pkgver}-${_subver}.zip
srcdir=${location}/${pkgname}

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  cd ../
  mkdir -p ${pkgdir}/usr/{bin,share}
  install -Dm755 netbeans.sh ${pkgdir}/usr/bin/netbeans
  cp -r netbeans ${pkgdir}/usr/share/
  rm -rf ${pkgdir}/usr/share/netbeans/bin/*exe
  sed -i -e 's/^basedir=.*$/basedir=\/usr\/share\/netbeans/g' ${pkgdir}/usr/share/netbeans/bin/netbeans
}
