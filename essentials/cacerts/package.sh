#!/bin/sh

#vcs=none
pkgname=cacerts
SKIP_ARCH_CHECK=1
pkgver=20161210

kiin_make() {
    :
}

kiin_install() {
    hg clone ${SOURCES_HOME}/nss
    cp nss/lib/ckfw/builtins/certdata.txt .
    rm -rf nss
    pkgdir=${pkgdir} bash make-ca.sh
    rm certdata.txt
}
