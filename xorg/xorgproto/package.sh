pkgname=xorgproto
pkgver=2019.1
vcs=git
gittag=${pkgname}-${pkgver}

build() {
    mkdir build
    meson --prefix=/usr . build
    ninja -C build
}

package() {
    DESTDIR=${pkgdir} ninja -C build install
}
