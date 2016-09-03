#!/bin/sh

# used by icu and blender

pkgname=llvm
pkgver=3.9.0
vcs=git
gittag=fbbabf3203c01be7bf5fe904be52aa16f2abf895
srcdir=${location}/${pkgname}-${pkgver}.src

kiin_make() {
    git clone ${SOURCES_HOME}/clang tools/clang
    cd tools/clang
    git checkout 07307f95d5c82d453cdc5c23f9ccd53d5ff75426
    cd ../../
    git clone ${SOURCES_HOME}/compiler-rt projects/compiler-rt
    cd projects/compiler-rt
    git checkout 38631afc1dec4d5b13b6460e808b5dae6c009081
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
