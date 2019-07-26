pkgname=libepoxy
pkgver=1.5.3
vcs=git
gittag=${pkgver}
relmon_id=6090

build() {
    ./autogen.sh --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
