#!/bin/sh

pkgname=mesa
pkgver=19.1.2
vcs=git
gittag=mesa-${pkgver}
# rc versions
#relmon_id=1970

build() {
    mkdir build
    meson --prefix=$XORG_PREFIX \
        -D b_lto=false \
        -D b_ndebug=true \
        -D platforms=x11,drm \
        -D dri-drivers='i965,swrast' \
        -D gallium-drivers='' \
        -D vulkan-drivers='' \
        -D swr-arches=avx,avx2 \
        -D dri3=true \
        -D egl=true \
        -D gbm=true \
        -D gles1=false \
        -D gles2=true \
        -D glx=dri \
        -D llvm=false \
        -D osmesa=classic \
        -D shared-glapi=true \
        -D valgrind=false \
        -D libunwind=false \
        . build
    ninja -C build
}

package() {
    DESTDIR=${pkgdir} ninja -C build install
    mkdir -pv ${pkgdir}${XORG_PREFIX}/share/doc/mesa
    cp -rfv docs/* ${pkgdir}${XORG_PREFIX}/share/doc/mesa
}
