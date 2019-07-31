pkgname=nmap
pkgver=7.70
vcs=git
gittag=${pkgver}
relmon_id=2096

build() {
    ./configure --prefix=/usr
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
