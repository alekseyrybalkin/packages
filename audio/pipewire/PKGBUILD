pkgname=pipewire
pkgver=0.2.6
ARCH_VERSION=0.2.6+1+g37613b67
vcs=git
gittag=${pkgver}

build() {
    mkdir build
    meson --prefix=/usr \
        -D libexecdir=/usr/lib \
        -D sysconfdir=/etc \
        -D gstreamer=disabled \
        . build
    ninja -C build
}

package() {
    DESTDIR=${pkgdir} ninja -C build install
}
