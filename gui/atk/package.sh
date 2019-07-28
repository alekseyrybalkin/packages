pkgname=atk
pkgver=2.32.0
vcs=git
gittag=ATK_${pkgver//\./_}
relmon_id=130
relmon_rules="skip_odd_second"

build() {
    mkdir build
    meson --prefix=/usr . build
    ninja -C build
}

package() {
    DESTDIR=${pkgdir} ninja -C build install
}
