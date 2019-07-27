pkgname=libssh2
pkgver=1.9.0
vcs=git
gittag=libssh2-${pkgver}
relmon_id=1730

build() {
    ./buildconf
    ./configure --prefix=/usr \
        --disable-static
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
