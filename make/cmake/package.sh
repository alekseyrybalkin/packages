pkgname=cmake
pkgver=3.15.1
vcs=git
gittag=v${pkgver}
relmon_id=306

build() {
    ./bootstrap --prefix=/usr \
        --system-libs \
        --mandir=/share/man \
        --docdir=/share/doc/cmake \
        --no-system-jsoncpp \
        --no-system-libarchive
    make
}

package() {
    make DESTDIR=${pkgdir} install
    # remove files with spaces
    rm -rf ${pkgdir}/usr/share/cmake-*/Help/generator
}
