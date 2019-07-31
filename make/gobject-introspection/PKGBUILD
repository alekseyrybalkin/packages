pkgname=gobject-introspection
pkgver=1.60.2
vcs=git
gittag=${pkgver}
relmon_id=1223
relmon_rules="skip_odd_second"

build() {
    ./autogen.sh --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
