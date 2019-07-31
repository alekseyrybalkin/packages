pkgname=libevdev
pkgver=1.7.0
vcs=git
gittag=libevdev-${pkgver}
relmon_id=20540

build() {
    ./autogen.sh --prefix=/usr --disable-static
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
