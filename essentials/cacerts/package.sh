#!/bin/sh

#vcs=none
pkgname=cacerts
SKIP_ARCH_CHECK=1
pkgver=20161210

kiin_make() {
    :
}

kiin_install() {
    cp ${SOURCES_HOME}/nss/lib/ckfw/builtins/certdata.txt .
    pkgdir=${pkgdir} bash make-ca.sh
    rm certdata.txt
}
