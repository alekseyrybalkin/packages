#!/bin/sh

pkgname=tidy-html5
ARCH_NAME=tidy
pkgver=5.7.27
vcs=git
#FIXME no tag
#gittag=${pkgver}
gittag=8ef80736a1dd9fae8b2a43684028f0da19cf16a1
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
