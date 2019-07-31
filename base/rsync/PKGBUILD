pkgname=rsync
pkgver=3.1.3
vcs=git
gittag=v${pkgver}
relmon_id=4217

build() {
    ./configure --prefix=/usr --without-included-zlib
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
