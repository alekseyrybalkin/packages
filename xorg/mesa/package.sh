#!/bin/sh

pkgname=mesa
pkgver=9.0
urls="ftp://ftp.freedesktop.org/pub/${pkgname}/${pkgver}/MesaLib-${pkgver}.tar.bz2"
srctar=MesaLib-${pkgver}.tar.bz2
srcdir=${location}/Mesa-${pkgver}

XORG_PREFIX="/usr"

kiin_make() {
  autoreconf -fi
  ./configure --prefix=$XORG_PREFIX \
    --sysconfdir=/etc \
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
