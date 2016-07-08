#!/bin/sh

pkgname=mesa
majorver=12.0
pkgver=${majorver}.0
vcs=git
gittag=mesa-${pkgver}
srcdir=${location}/mesa-${pkgver}

kiin_make() {
    patch -Np1 -i ../MesaLib-add_xdemos.patch
    sed -i -e '/PTHREADSTUBS/d' configure.ac
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
            --enable-texture-float
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
            --enable-texture-float
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
