pkgname=libevdev
pkgver=1.7.0
vcs=git
gittag=libevdev-${pkgver}

build() {
    ./autogen.sh --prefix=/usr --disable-static
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
