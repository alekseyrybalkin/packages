#!/bin/sh

pkgname=libcap
pkgver=2.25
vcs=git
gittag=libcap-${pkgver}
extension=xz
folder="https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/"
check_server=1
relmon_id=1569

. ${UNDEAD_REPO}/defaults.sh

undead_make() {
    sed -i '/install.*STALIBNAME/ s/^/#/' libcap/Makefile
    patch -Np1 -i ../gperf-3.1.patch
    make
}

undead_install() {
    make prefix=/usr lib=/lib DESTDIR=${pkgdir} RAISE_SETFCAP=no install
    chmod -v 755 ${pkgdir}/usr/lib/libcap.so
    mv ${pkgdir}/usr/{sbin,bin}
}
