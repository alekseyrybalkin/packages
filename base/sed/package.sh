#!/bin/sh

pkgname=sed
pkgver=4.7
vcs=git
gittag=v${pkgver}
relmon_id=4789

build() {
    git clone -s `find_vcs_repo gnulib`
    sed -i -e '/\/missing/d' bootstrap
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu
    make
}

package() {
    make DESTDIR=${pkgdir} install
}
