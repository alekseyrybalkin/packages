pkgname=icu
pkgver=64.2
vcs=git
gittag=release-${pkgver//\./-}

build() {
    cd icu4c/source
    ./configure --prefix=/usr --sbindir=/usr/bin
    make
}

package() {
    cd icu4c/source
    make DESTDIR=${pkgdir} install
}
