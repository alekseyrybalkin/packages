pkgname=openjpeg
pkgver=2.3.1
vcs=git
gittag=v${pkgver}
relmon_id=8468

build() {
    mkdir build
    cd build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_DOC=off
    make
}

package() {
    cd build
    make DESTDIR=${pkgdir} install
}
