#!/bin/sh

pkgname=binutils
pkgver=2.30
vcs=git
vcs_pkgname=binutils-gdb
#FIXME
gittag=binutils-${pkgver//\./_}
extension=gz
folder="http://ftp.gnu.org/gnu/${pkgname}/"
check_server=1
relmon_id=7981

. ${UNDEAD_REPO}/defaults.sh

undead_make() {
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

undead_install() {
    cd binutils-build
    make prefix=${pkgdir}/usr tooldir=${pkgdir}/usr install
}
