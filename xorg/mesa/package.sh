#!/bin/sh

pkgname=mesa
pkgver=9.0
urls="ftp://ftp.freedesktop.org/pub/${pkgname}/${pkgver}/MesaLib-${pkgver}.tar.bz2 \
      http://www.linuxfromscratch.org/patches/blfs/svn/MesaLib-9.0-add_xdemos-4.patch"
srctar=MesaLib-${pkgver}.tar.bz2
srcdir=${location}/Mesa-${pkgver}

XORG_PREFIX="/usr"

kiin_make() {
  patch -Np1 -i ../MesaLib-9.0-add_xdemos-4.patch
  autoreconf -fi
  ./configure --prefix=$XORG_PREFIX \
    --sysconfdir=/etc \
    --with-gallium-drivers='' \
    --with-dri-drivers='i965' \
    --enable-egl \
    --with-egl-platforms=x11,drm \
    --enable-shared-glapi \
    --enable-glx-tls \
    --enable-dri \
    --enable-glx \
    --enable-osmesa \
    --enable-gles1 \
    --enable-gles2 \
    --enable-texture-float \
    --enable-shared-dricore \
    --without-nouveau
  make
  make -C xdemos DEMOS_PREFIX=/usr
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  make -C xdemos DEMOS_PREFIX=/usr DESTDIR=${pkgdir} install
  mkdir -pv ${pkgdir}${XORG_PREFIX}/share/doc/MesaLib-${pkgver}
  cp -rfv docs/* ${pkgdir}${XORG_PREFIX}/share/doc/MesaLib-${pkgver}
}
