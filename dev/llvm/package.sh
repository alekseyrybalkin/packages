#!/bin/sh

pkgname=llvm
pkgver=3.8.0
vcs=git
gittag=ad5750369cc5b19f36c149f7b13151c99c7be47a
srcdir=${location}/${pkgname}-${pkgver}.src

kiin_make() {
    git clone ${SOURCES_HOME}/clang tools/clang
    cd tools/clang
    git checkout 9fd77bd68130d9b2fbc56a3138b6f981d560480a
    cd ../../
    git clone ${SOURCES_HOME}/compiler-rt projects/compiler-rt
    cd projects/compiler-rt
    git checkout 31769223eb782e7b03655810d00dfdec66467d51
    cd ../../
    mkdir -v build
    cd build
    CC=gcc CXX=g++ \
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DLLVM_ENABLE_FFI=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=ON \
        -DLLVM_TARGETS_TO_BUILD="host;AMDGPU" \
        -Wno-dev ..
    make
}

kiin_install() {
    cd build
    make DESTDIR=${pkgdir} install
    mv ${pkgdir}/usr/libexec/* ${pkgdir}/usr/bin/
    rmdir ${pkgdir}/usr/libexec
}
