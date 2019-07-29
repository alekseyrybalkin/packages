pkgname=llvm
pkgver=8.0.1
vcs=git
gittag=llvmorg-${pkgver}
relmon_id=1830

build() {
    cd llvm
    mv ../clang tools/
    mv ../compiler-rt projects/
    mkdir -v build
    cd build
    CC=gcc CXX=g++ \
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DLLVM_ENABLE_FFI=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DLLVM_BUILD_LLVM_DYLIB=ON \
        -DLLVM_LINK_LLVM_DYLIB=ON \
        -DLLVM_ENABLE_RTTI=ON \
        -DLLVM_TARGETS_TO_BUILD="host" \
        -Wno-dev -G Ninja ..
    ninja
}

package() {
    cd llvm
    cd build
    DESTDIR=${pkgdir} ninja install
    mv ${pkgdir}/usr/libexec/* ${pkgdir}/usr/bin/
    rmdir ${pkgdir}/usr/libexec
}
