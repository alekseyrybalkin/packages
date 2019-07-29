pkgname=poppler
pkgver=0.79.0
vcs=git
gittag=poppler-${pkgver}
relmon_id=3686

build() {
    mkdir build
    cd build

    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DTESTDATADIR=$PWD/testfiles \
        -DENABLE_XPDF_HEADERS=ON \
        ..
    make
}

package() {
    cd build
    make DESTDIR=${pkgdir} install
    mv ${pkgdir}/usr/lib{64,}
}
