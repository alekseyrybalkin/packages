pkgname=acpi
pkgver=1.7
vcs=git
gittag=${pkgver}
relmon_id=17

build() {
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
