pkgname=bc
pkgver=2.1.1
vcs=git
gittag=${pkgver}

build() {
    PREFIX=/usr CC=gcc CFLAGS="-std=c99" ./configure.sh -G -O3
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
