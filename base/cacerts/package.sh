#!/bin/sh

pkgname=cacerts
SKIP_ARCH_CHECK=1
pkgver=20190604
vcs=mercurial
vcs_pkgname=nss

build() {
    :
}

package() {
    mkdir build
    cd build
    cp ../lib/ckfw/builtins/certdata.txt .
    pkgdir=${pkgdir} bash ../../make-ca.sh
    mkdir -pv ${pkgdir}/etc/ssl/certs/
    ln -sv /etc/ssl/ca-bundle.crt ${pkgdir}/etc/ssl/certs/ca-certificates.crt
}
