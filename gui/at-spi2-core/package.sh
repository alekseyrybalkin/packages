pkgname=at-spi2-core
pkgver=2.32.1
vcs=git
gittag=AT_SPI2_CORE_${pkgver//\./_}
relmon_id=7841

build() {
    mkdir build
    meson --prefix=/usr -D libexecdir=/usr/lib -D sysconfdir=/etc . build
    ninja -C build
}

package() {
    DESTDIR=${pkgdir} ninja -C build install
}
