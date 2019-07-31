pkgname=djvulibre
pkgver=3.5.27.1
vcs=git
gittag=release.${pkgver}
relmon_id=10159

build() {
    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr --disable-desktopfiles
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
