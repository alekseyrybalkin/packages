#!/bin/sh

pkgname=linux-libre-api-headers
pkgver=3.10.9
urls="http://linux-libre.fsfla.org/pub/linux-libre/releases/${pkgver}-gnu/linux-libre-${pkgver}-gnu.tar.xz"
srctar=linux-libre-${pkgver}-gnu.tar.xz
srcdir=${location}/linux-${pkgver}

kiin_make() {
  make mrproper
  make headers_check
}

kiin_install() {
  make INSTALL_HDR_PATH=dest headers_install
  find dest/include \( -name .install -o -name ..install.cmd \) -delete
  mkdir -pv ${pkgdir}/usr/include
  cp -rv dest/include/* ${pkgdir}/usr/include
}
