#!/bin/sh

pkgname=binutils
pkgver=2.28
ARCH_VERSION=${pkgver}.0
vcs=git
vcs_pkgname=binutils-gdb
gittag=binutils-${pkgver//\./_}
extension=gz
folder="http://ftp.gnu.org/gnu/${pkgname}/"
check_server=1
relmon_id=7981

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    rm -rf gdb libdecnumber readline sim zlib
    mkdir -v binutils-build
    cd binutils-build
    ../configure --prefix=/usr \
        --enable-shared \
        --enable-gold \
        --enable-ld=default \
        --enable-plugins \
        --build=x86_64-unknown-linux-gnu \
        --with-system-zlib
    make tooldir=${pkgdir}/usr
}

kiin_install() {
    cd binutils-build
    make prefix=${pkgdir}/usr tooldir=${pkgdir}/usr install
}
