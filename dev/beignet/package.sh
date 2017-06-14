#!/bin/sh

pkgname=beignet
pkgver=1.3.1
vcs=git
gittag=Release_v${pkgver}
relmon_id=178

kiin_make() {
    # LLVM 4.0.0 support
    patch -Np1 -i ../0001-Backend-Remove-old-llvm-support-code.patch
    patch -Np1 -i ../0002-Backend-Fix-an-include-file-error-problem.patch
    patch -Np1 -i ../0003-Backend-Refine-LLVM-version-check-macro.patch
    patch -Np1 -i ../0004-Backend-Add-LLVM40-support.patch

    mkdir -p build
    cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_BUILD_TYPE=RELEASE
    make
}

kiin_install() {
    cd build
    make DESTDIR=${pkgdir} install
    cd ${pkgdir}/usr/include/CL
    rm cl.h cl_egl.h cl_ext.h cl_gl.h cl_gl_ext.h cl_platform.h opencl.h
}
