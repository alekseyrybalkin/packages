#!/bin/sh

pkgname=binutils
pkgver=2.27
vcs=git
vcs_pkgname=binutils-gdb
gittag=binutils-${pkgver//\./_}
extension=gz
folder="http://ftp.gnu.org/gnu/${pkgname}/"
check_server=1

. ${KIIN_REPO}/defaults.sh

kiin_make() {
    patch -Np1 -i ../flex-2.6.3.patch
    patch -Np1 -i ../flex-2.6.3-2.patch
    rm -rf gdb libdecnumber readline sim zlib
    mkdir -v binutils-build
    cd binutils-build
    ../configure --prefix=/usr \
        --enable-shared \
        --enable-gold \
        --enable-ld=default \
        --enable-plugins \
        --with-system-zlib
    make tooldir=${pkgdir}/usr
}

kiin_install() {
    cd binutils-build
    make prefix=${pkgdir}/usr tooldir=${pkgdir}/usr install
}
