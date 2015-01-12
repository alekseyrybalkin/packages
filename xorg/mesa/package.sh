#!/bin/sh

pkgname=mesa
majorver=10.4
pkgver=${majorver}.2
patchver=10.3.5
urls="ftp://ftp.freedesktop.org/pub/${pkgname}/${pkgver}/MesaLib-${pkgver}.tar.bz2 \
  http://www.linuxfromscratch.org/patches/blfs/svn/MesaLib-${patchver}-add_xdemos-1.patch"
srctar=MesaLib-${pkgver}.tar.bz2
srcdir=${location}/Mesa-${pkgver}

kiin_make() {
  patch -Np1 -i ${KIIN_HOME}/tarballs/MesaLib-${patchver}-add_xdemos-1.patch
  autoreconf -fi
  if [ -z "$KIIN_LIB32" ]; then
    ./configure --prefix=$XORG_PREFIX \
      --sysconfdir=/etc \
      --with-gallium-drivers='' \
      --with-dri-drivers='i965' \
      --enable-egl \
      --enable-gbm \
      --with-egl-platforms=x11,drm \
      --enable-shared-glapi \
      --enable-glx-tls \
      --enable-dri \
      --enable-dri3 \
      --enable-glx \
      --enable-osmesa \
      --enable-gles1 \
      --enable-gles2 \
      --enable-texture-float \
      --enable-shared-dricore \
      --without-nouveau
    make
    make -C xdemos DEMOS_PREFIX=/usr
  else
    ./configure --prefix=$XORG_PREFIX \
      --build=i686-pc-linux-gnu \
      --host=i686-pc-linux-gnu \
      --sysconfdir=/etc \
      --with-gallium-drivers='' \
      --with-dri-drivers='i965' \
      --enable-egl \
      --enable-gbm \
      --with-egl-platforms=x11,drm \
      --enable-shared-glapi \
      --enable-glx-tls \
      --enable-dri \
      --enable-dri3 \
      --enable-glx \
      --enable-osmesa \
      --enable-gles1 \
      --enable-gles2 \
      --enable-texture-float \
      --enable-shared-dricore \
      --without-nouveau \
      --with-dri-driverdir=/usr/lib32/xorg/modules/dri \
      --libdir=/usr/lib32
    make
  fi
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  if [ -z "$KIIN_LIB32" ]; then
    make -C xdemos DEMOS_PREFIX=/usr DESTDIR=${pkgdir} install
    mkdir -pv ${pkgdir}${XORG_PREFIX}/share/doc/mesa
    cp -rfv docs/* ${pkgdir}${XORG_PREFIX}/share/doc/mesa
  fi
}
