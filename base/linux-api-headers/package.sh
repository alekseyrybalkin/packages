#!/bin/sh

pkgname=linux-api-headers
git_pkgname=linux-stable
vcs="git"
gittag=v3.10.9
pkgver=3.10.9
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
