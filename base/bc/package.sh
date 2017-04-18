#!/bin/sh

#vcs=none
pkgname=bc
pkgver=1.07.1
extension=gz
folder="ftp://ftp.gnu.org/gnu/${pkgname}/"
check_server=1
relmon_id=170

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    cat > bc/fix-libmath_h << "EOF"
#! /bin/bash
sed -e '1   s/^/{"/' \
    -e     's/$/",/' \
    -e '2,$ s/^/"/'  \
    -e   '$ d'       \
    -i libmath.h

sed -e '$ s/$/0}/' \
    -i libmath.h
EOF
    ./configure --prefix=/usr \
        --mandir=/usr/share/man \
        --infodir=/usr/share/info \
        --with-readline
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
