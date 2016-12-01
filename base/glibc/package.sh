#!/bin/sh

KIIN_NO_STRIPPING=1
pkgname=glibc
pkgver=2.24.1
vcs=git
gittag=2d16e81babd1d7b66d10cec0bc6d6d86a7e0c95e
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    mkdir -v glibc-build
    cd glibc-build
    echo "sbindir=/usr/bin" >> configparms
    echo "rootsbindir=/usr/bin" >> configparms
    echo "slibdir=/usr/lib" >> configparms
    ../configure \
        --prefix=/usr \
        --disable-profile \
        --enable-kernel=4.4 \
        --enable-obsolete-rpc \
        --libexecdir=/usr/lib/glibc \
        --disable-build-nscd \
        --disable-nscd \
        --enable-lock-elision=no \
        --build=x86_64-pc-linux-gnu \
        --libdir=/usr/lib
    make
}

kiin_install() {
    cd glibc-build
    make install_root=${pkgdir} install
    rm -rvf ${pkgdir}/var
    rm -rvf ${pkgdir}/lib64
}

kiin_after_install() {
    localedef -i en_US -f UTF-8 en_US.UTF-8
    localedef -i ru_RU -f UTF-8 ru_RU.UTF-8
}

kiin_after_upgrade() {
    kiin_after_install
}

known="usr/lib/locale/locale-archive"
