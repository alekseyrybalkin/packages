#!/bin/sh

UNDEAD_NO_STRIPPING=1
pkgname=glibc
pkgver=2.27
vcs=git
# FIXME
gittag=39071a55392d2d2e0b75fb19f2b48d661c4cc682
relmon_id=5401

undead_make() {
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
        --enable-obsolete-nsl \
        --enable-stack-protector=strong \
        --enable-stackguard-randomization \
        --libexecdir=/usr/lib/glibc \
        --disable-build-nscd \
        --disable-nscd \
        --enable-lock-elision=no \
        --build=x86_64-unknown-linux-gnu \
        --libdir=/usr/lib
    make
}

undead_install() {
    cd glibc-build
    make install_root=${pkgdir} install
    rm -rvf ${pkgdir}/var
    rm -rvf ${pkgdir}/lib64
}

undead_after_install() {
    localedef -i en_US -f UTF-8 en_US.UTF-8
    localedef -i ru_RU -f UTF-8 ru_RU.UTF-8
}

undead_after_upgrade() {
    undead_after_install
}

known="usr/lib/locale/locale-archive"
