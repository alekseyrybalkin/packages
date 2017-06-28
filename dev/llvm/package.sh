#!/bin/sh

# used by icu, blender

pkgname=llvm
pkgver=4.0.1
vcs=git
# FIXME
gittag=c8fccc53ed66d505898f8850bcc690c977a7c9a7
relmon_id=1830

kiin_make() {
    git clone -s -n ${SOURCES_HOME}/clang tools/clang
    cd tools/clang
    # FIXME
    git checkout 3c8961bedc65c9a15cbe67a2ef385a0938f7cfef
    cd ../../
    git clone -s -n ${SOURCES_HOME}/compiler-rt projects/compiler-rt
    cd projects/compiler-rt
    # FIXME
    git checkout 76ab2e5c9b2a2e3d638e217cc21622f9be54f633
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
