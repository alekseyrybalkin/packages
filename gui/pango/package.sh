pkgname=pango
pkgver=1.43.0
vcs=git
gittag=${pkgver}
relmon_id=11783

build() {
    mkdir build
    meson --prefix=/usr -D libexecdir=/usr/lib -D sysconfdir=/etc . build
    ninja -C build
}

package() {
    DESTDIR=${pkgdir} ninja -C build install
}
