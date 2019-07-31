pkgname=libass
pkgver=0.14.0
vcs=git
gittag=${pkgver}
relmon_id=1560

build() {
    ./autogen.sh
    ./configure --prefix=/usr --enable-harfbuzz --enable-fontconfig --disable-static
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
