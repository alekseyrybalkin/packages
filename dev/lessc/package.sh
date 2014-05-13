#!/bin/sh

pkgname=lessc
pkgver=1.7.0
urls="https://registry.npmjs.org/less/-/less-${pkgver}.tgz"
srctar=less-${pkgver}.tgz
srcdir=${location}/package

kiin_make() {
  echo "nothing to make..."
}

kiin_install() {
  npm install -g --user root --prefix ${pkgdir}/usr ${KIIN_HOME}/tarballs/less-${pkgver}.tgz
}
