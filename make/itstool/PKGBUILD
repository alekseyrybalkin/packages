pkgname=itstool
pkgver=2.0.6
vcs=git
gittag=${pkgver}
relmon_id=13109

build() {
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
