pkgname=tidy-html5
ARCH_NAME=tidy
pkgver=5.7.28
vcs=git
gittag=${pkgver}
relmon_id=13267

build() {
    cd build/cmake
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TAB2SPACE=ON \
        ../..
    make
}

package() {
    cd build/cmake
    make DESTDIR=${pkgdir} install
    install -v -m755 tab2space ${pkgdir}/usr/bin
}
