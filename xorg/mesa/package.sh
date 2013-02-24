#!/bin/sh

pkgname=mesa
pkgver=9.1
urls="ftp://ftp.freedesktop.org/pub/${pkgname}/${pkgver}/MesaLib-${pkgver}.tar.bz2"
srctar=MesaLib-${pkgver}.tar.bz2
srcdir=${location}/Mesa-${pkgver}

kiin_make() {
  patch -Np1 -i ../MesaLib-${pkgver}-add_xdemos-5.patch
  autoreconf -fi
  if [ -z "$KIIN_LIB32" ]; then
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
  else
    sed -i -e "s/libudev/libudevfail/g" configure
    sed -i -e "s/libudev/libudevfail/g" configure.ac
    ./configure --prefix=$XORG_PREFIX \
      --sysconfdir=/etc \
      --with-gallium-drivers='' \
      --with-dri-drivers='i965' \
      --enable-shared-glapi \
      --enable-glx-tls \
      --enable-dri \
      --enable-glx \
      --enable-osmesa \
      --enable-gles1 \
      --enable-gles2 \
      --enable-texture-float \
      --enable-shared-dricore \
      --without-nouveau \
      --disable-egl \
      --disable-gbm \
      --enable-32-bit \
      --with-dri-driverdir=/usr/lib32/xorg/modules/dri \
      --libdir=/usr/lib32
    make
  fi
}

kiin_install() {
  make DESTDIR=${pkgdir} install
  if [ -z "$KIIN_LIB32" ]; then
    make -C xdemos DEMOS_PREFIX=/usr DESTDIR=${pkgdir} install
    mkdir -pv ${pkgdir}${XORG_PREFIX}/share/doc/MesaLib-${pkgver}
    cp -rfv docs/* ${pkgdir}${XORG_PREFIX}/share/doc/MesaLib-${pkgver}
  fi
}
