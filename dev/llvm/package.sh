#!/bin/sh

# used by icu, blender, protobuf, python-protobuf and rust

pkgname=llvm
pkgver=3.9.1
vcs=git
gittag=a093ef43dd592b729da46db4ff3057fef9a46023
srcdir=${location}/${pkgname}-${pkgver}.src
relmon_id=1830

kiin_make() {
    sed -i -e 's/${TT_OUT}/"x86_64-pc-linux-gnu"/g' cmake/modules/GetHostTriple.cmake

    git clone -s -n ${SOURCES_HOME}/clang tools/clang
    cd tools/clang
    git checkout 54f5752c3600d39ee8de62ba9ff304154baf5e80
    cd ../../
    git clone -s -n ${SOURCES_HOME}/compiler-rt projects/compiler-rt
    cd projects/compiler-rt
    git checkout 9822763f9403c0740a01b7b5b50e3f15eec76b65
    cd ../../
    mkdir -v build
    cd build
    CC=gcc CXX=g++ \
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DLLVM_ENABLE_FFI=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=ON \
        -DLLVM_TARGETS_TO_BUILD="host;AMDGPU" \
        -DLLVM_DEFAULT_TARGET_TRIPLE=x86_64-pc-linux-gnu \
        -DLLVM_HOST_TRIPLE=x86_64-pc-linux-gnu \
        -Wno-dev ..
    make
}

kiin_install() {
    cd build
    make DESTDIR=${pkgdir} install
    mv ${pkgdir}/usr/libexec/* ${pkgdir}/usr/bin/
    rmdir ${pkgdir}/usr/libexec
}
