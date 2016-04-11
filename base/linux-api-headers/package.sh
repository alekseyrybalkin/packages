#!/bin/sh

pkgname=linux-api-headers
vcs=git
pkgver=4.6.rc3
gittag=v4.6-rc3
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
