#!/bin/sh

pkgname=blender
vcs="git"
pkgver=2.73a
gittag=v2.73a
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
    -DWITH_CODEC_SNDFILE=ON \
    -DWITH_CYCLES=OFF \
    -DWITH_LLVM=ON \
    -DLLVM_VERSION=3.6 \
    -DLLVM_STATIC=OFF \
    -DWITH_CYCLES_CUDA_BINARIES=OFF \
    -DWITH_CYCLES_OSL=OFF \
    -DWITH_FFTW3=OFF \
    -DWITH_MOD_OCEANSIM=OFF \
    -DPYTHON_VERSION=3.4 \
    -DPYTHON_LIBPATH=/usr/lib \
    -DPYTHON_LIBRARY=python3.4m \
    -DPYTHON_INCLUDE_DIRS=/usr/include/python3.4m \
    -DCMAKE_CXX_FLAGS_RELEASE="-fno-delete-null-pointer-checks -DNDEBUG" \
    -DCMAKE_C_FLAGS_RELEASE="-fno-delete-null-pointer-checks -DNDEBUG"
  make
}

kiin_install() {
  cd build
  make DESTDIR=${pkgdir} install
  python3 -m compileall "${pkgdir}/usr/share/blender"
  python3 -O -m compileall "${pkgdir}/usr/share/blender"
}

kiin_after_install() {
  update-desktop-database -q
  update-mime-database /usr/share/mime
}

kiin_after_upgrade() {
  kiin_after_install
}
