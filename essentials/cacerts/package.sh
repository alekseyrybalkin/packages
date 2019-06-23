#!/bin/sh

#vcs=none
pkgname=cacerts
SKIP_ARCH_CHECK=1
pkgver=20190604

kiin_make() {
    :
}

kiin_install() {
    hg clone ${SOURCES_HOME}/gui/nss
    cp nss/lib/ckfw/builtins/certdata.txt .
    rm -rf nss
    pkgdir=${pkgdir} bash ../make-ca.sh
    rm certdata.txt
    mkdir -pv ${pkgdir}/etc/ssl/certs/
    ln -sv /etc/ssl/ca-bundle.crt ${pkgdir}/etc/ssl/certs/ca-certificates.crt
}
