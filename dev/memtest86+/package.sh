#!/bin/sh

pkgname=memtest86+
pkgver=5.01
urls="http://www.memtest.org/download/${pkgver}/${pkgname}-${pkgver}.bin.gz"

kiin_make() {
    :
}

kiin_install() {
  cp ${KIIN_HOME}/tarballs/${pkgname}-${pkgver}.bin.gz .
  gunzip ${pkgname}-${pkgver}.bin.gz
  install -D -m644 ${pkgname}-${pkgver}.bin ${pkgdir}/boot/memtest86+/memtest.bin
  rm ${pkgname}-${pkgver}.bin
}
