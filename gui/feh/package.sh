pkgname=feh
pkgver=3.2.1
vcs=git
gittag=${pkgver}
relmon_id=790

build() {
    make PREFIX=/usr
}

package() {
    make PREFIX=/usr DESTDIR=${pkgdir} install
}
