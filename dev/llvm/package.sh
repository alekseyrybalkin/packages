#!/bin/sh

# used by icu, blender, protobuf, python-protobuf

pkgname=llvm
pkgver=4.0.0
vcs=git
gittag=4423e351176a92975739dd4ea43c2ff5877236ae
relmon_id=1830

kiin_make() {
    git clone -s -n ${SOURCES_HOME}/clang tools/clang
    cd tools/clang
    git checkout 559aa046fe3260d8640791f2249d7b0d458b5700
    cd ../../
    git clone -s -n ${SOURCES_HOME}/compiler-rt projects/compiler-rt
    cd projects/compiler-rt
    git checkout 1fdc27db84c9d0d9ae4ae60185629e8c43b4a11c
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
