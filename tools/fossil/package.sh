pkgname=fossil
pkgver=2.8
vcs=fossil
fossiltag=version-${pkgver}
relmon_id=13971
relmon_rules="skip_one_good"

build() {
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
