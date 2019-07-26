pkgname=xclip
pkgver=0.13
vcs=git
gittag=${pkgver}
relmon_id=14150

build() {
    ./bootstrap
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
