#!/bin/sh

pkgname=lld
pkgver=8.0.0
vcs=git
vcs_pkgname=llvm
gittag=llvmorg-${pkgver}
relmon_id=1830

kiin_make() {
    cd lld
    mkdir -v build
    cd build
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DLLVM_LINK_LLVM_DYLIB=ON \
        -G Ninja ..
    ninja
}

kiin_install() {
    cd lld
    cd build
    DESTDIR=${pkgdir} ninja install
}
