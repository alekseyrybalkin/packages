#!/bin/sh

pkgname=blender
pkgver=2.78c
ARCH_VERSION=2.78.c
vcs=git
git_repo=git://git.blender.org/blender.git
gittag=v${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    mkdir build
    cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DWITH_INSTALL_PORTABLE=OFF \
        -DWITH_PYTHON_INSTALL=OFF \
        -DWITH_OPENCOLLADA=OFF \
        -DWITH_GAMEENGINE=ON \
        -DWITH_JACK=ON \
        -DWITH_PLAYER=ON \
        -DWITH_CODEC_FFMPEG=ON \
        -DWITH_CODEC_SNDFILE=OFF \
        -DWITH_CYCLES=OFF \
        -DWITH_LLVM=ON \
        -DLLVM_VERSION=3.8 \
        -DLLVM_STATIC=OFF \
        -DWITH_CYCLES_CUDA_BINARIES=OFF \
        -DWITH_CYCLES_OSL=OFF \
        -DWITH_FFTW3=OFF \
        -DWITH_MOD_OCEANSIM=OFF \
        -DPYTHON_VERSION=3.6 \
        -DPYTHON_LIBPATH=/usr/lib \
        -DPYTHON_LIBRARY=python3.6m \
        -DPYTHON_INCLUDE_DIRS=/usr/include/python3.6m \
        -DWITH_SYSTEM_GLEW=OFF
    make
}

kiin_install() {
    cd build
    make DESTDIR=${pkgdir} install
    python -m compileall ${pkgdir}/usr/share/blender
    python -O -m compileall ${pkgdir}/usr/share/blender
}

kiin_after_install() {
    update-desktop-database -q
    update-mime-database /usr/share/mime
}

kiin_after_upgrade() {
    kiin_after_install
}
