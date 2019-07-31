pkgname=git-crypt
pkgver=0.6.0
vcs=git
gittag=${pkgver}
relmon_id=17093

build() {
    make ENABLE_MAN=yes PREFIX=/usr
}

package() {
    make ENABLE_MAN=yes PREFIX=/usr DESTDIR=${pkgdir} install
}
