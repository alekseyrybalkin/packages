pkgname=fossil
pkgver=2.8
vcs=fossil
fossiltag=version-${pkgver}
# lists 2.9 before release
#relmon_id=13971

build() {
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
