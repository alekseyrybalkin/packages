#!/bin/sh

pkgname=mesa
pkgver=8.0.4
urls="ftp://ftp.freedesktop.org/pub/${pkgname}/${pkgver}/MesaLib-${pkgver}.tar.bz2 \
  http://www.linuxfromscratch.org/patches/blfs/svn/MesaLib-8.0.4-llvm-3.1-fixes-1.patch"
srctar=MesaLib-${pkgver}.tar.bz2
srcdir=${location}/Mesa-${pkgver}

XORG_PREFIX="/usr"

kiin_make() {
  sed 's@FLAGS=\"-g@FLAGS=\"@' -i configure
  patch -Np1 -i ../MesaLib-8.0.4-llvm-3.1-fixes-1.patch
  ./configure --prefix=$XORG_PREFIX \
    --enable-texture-float \
    --enable-gles1 \
    --enable-gles2 \
    --enable-shared-glapi \
    --enable-shared-dricore \
    --enable-glx-tls \
    --without-nouveau \
    --with-gallium-drivers='i915' \
    --with-dri-drivers='i915'
  make
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}${XORG_PREFIX}/share/doc/MesaLib-${pkgver}
  cp -rfv docs/* ${pkgdir}${XORG_PREFIX}/share/doc/MesaLib-${pkgver}
}
