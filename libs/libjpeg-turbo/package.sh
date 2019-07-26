pkgname=libjpeg-turbo
pkgver=2.0.2
vcs=git
gittag=${pkgver}
relmon_id=1648

build() {
    mkdir build
    cd build

    cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RELEASE  \
        -DENABLE_STATIC=FALSE       \
        -DCMAKE_INSTALL_DOCDIR=/usr/share/doc/libjpeg-turbo \
        -DCMAKE_INSTALL_DEFAULT_LIBDIR=lib \
        ..
    make
}

package() {
    cd build
    make DESTDIR=${pkgdir} install
}
