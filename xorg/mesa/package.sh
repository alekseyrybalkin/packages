#!/bin/sh

pkgname=mesa
majorver=17.1
pkgver=${majorver}.0
vcs=git
gittag=mesa-${pkgver}
# rc versions
#relmon_id=1970

kiin_make() {
    patch -Np1 -i ../MesaLib-add_xdemos.patch
    autoreconf -fi
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
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    make -C xdemos DEMOS_PREFIX=/usr DESTDIR=${pkgdir} install
    mkdir -pv ${pkgdir}${XORG_PREFIX}/share/doc/mesa
    cp -rfv docs/* ${pkgdir}${XORG_PREFIX}/share/doc/mesa
}
