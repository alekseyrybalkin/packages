#!/bin/sh

pkgname=diffutils
pkgver=3.7
vcs=git
gittag=v${pkgver}
relmon_id=436

build() {
    git clone -s `find_vcs_repo gnulib`
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
