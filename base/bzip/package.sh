#!/bin/sh

pkgname=bzip
ARCH_NAME=bzip2
pkgver=1.0.8
vcs=git
vcs_pkgname=bzip2
gittag=bzip2-${pkgver}
relmon_id=237

build() {
    sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile
    sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile
    make -f Makefile-libbz2_so
    make clean
    make
    ./xmlproc.sh -html manual.xml
}

package() {
    mkdir ${pkgdir}/usr
    make PREFIX=${pkgdir}/usr install
    rm -v ${pkgdir}/usr/bin/{bunzip2,bzcat,bzip2}
    cp -v bzip2-shared ${pkgdir}/usr/bin/bzip2
    ln -sv bzip2 ${pkgdir}/usr/bin/bunzip2
    ln -sv bzip2 ${pkgdir}/usr/bin/bzcat
    cp -av libbz2.so* ${pkgdir}/usr/lib
    ln -sv libbz2.so.1.0 ${pkgdir}/usr/lib/libbz2.so
    install -Dm644 manual.html ${pkgdir}/usr/share/doc/bzip/manual.html
}
