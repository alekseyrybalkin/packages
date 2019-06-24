#!/bin/sh

pkgname=openjdk
SKIP_ARCH_CHECK=1
pkgver=12
_build=33
vcs=mercurial
hgtag=jdk-${pkgver}-${_build}

kiin_make() {
    PATH=/usr/bin

    unset MAKEFLAGS
    bash configure --enable-unlimited-crypto \
        --with-boot-jdk=/usr/lib/openjdk \
        --disable-warnings-as-errors \
        --with-stdc++lib=dynamic \
        --with-giflib=system \
        --with-lcms=system \
        --with-libjpeg=system \
        --with-libpng=system \
        --with-zlib=system \
        --with-version-build="${_build}" \
        --with-version-pre="" \
        --with-version-opt="" \
        --with-jobs=4 \
        --with-extra-cflags="${CFLAGS}" \
        --with-extra-cxxflags="${CXXFLAGS}"
    make images
}

kiin_install() {
    mkdir -p ${pkgdir}/usr/lib/openjdk
    cp -rv build/*/images/jdk/* ${pkgdir}/usr/lib/openjdk/
    rm -vf ${pkgdir}/usr/lib/openjdk/lib/security/cacerts
}
