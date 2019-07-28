pkgname=xorgproto
pkgver=2019.1
vcs=git
gittag=${pkgname}-${pkgver}
relmon_id=17190

build() {
    mkdir build
    meson --prefix=/usr . build
    ninja -C build
}

package() {
    DESTDIR=${pkgdir} ninja -C build install
}
