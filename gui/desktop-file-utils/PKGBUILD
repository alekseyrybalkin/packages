pkgname=desktop-file-utils
pkgver=0.24
vcs=git
gittag=${pkgver}
relmon_id=421

build() {
    NOCONFIGURE=1 ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
