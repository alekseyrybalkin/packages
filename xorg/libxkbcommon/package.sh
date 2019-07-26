pkgname=libxkbcommon
pkgver=0.8.4
vcs=git
gittag=xkbcommon-${pkgver}
relmon_id=1780

build() {
    mkdir build
    meson --prefix=/usr -D libexecdir=/usr/lib -D sysconfdir=/etc \
        -D enable-wayland=false \
        -D enable-docs=false \
        . build
    ninja -C build
}

package() {
    DESTDIR=${pkgdir} ninja -C build install
}
