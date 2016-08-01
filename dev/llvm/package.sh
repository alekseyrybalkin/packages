#!/bin/sh

pkgname=llvm
pkgver=3.8.1
vcs=git
gittag=051e787f26dbfdc26cf61a57bc82ca00dcb812e8
srcdir=${location}/${pkgname}-${pkgver}.src

kiin_make() {
    git clone ${SOURCES_HOME}/clang tools/clang
    cd tools/clang
    git checkout 2cb088be9c6a3d1ef9a050d44e1b01393983fc4d
    cd ../../
    git clone ${SOURCES_HOME}/compiler-rt projects/compiler-rt
    cd projects/compiler-rt
    git checkout baf33ca40a468d3416c26e19a479db89eb571958
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
