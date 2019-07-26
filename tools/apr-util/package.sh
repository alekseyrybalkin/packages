#!/bin/sh

pkgname=apr-util
pkgver=1.6.1
vcs=git
gittag=${pkgver}
relmon_id=96

build() {
    cd ../
    git clone -s `find_vcs_repo apr` apr
    sed -i -e 's/python/python2/g' apr/build/gen-build.py
    cd ${srcdir}
    ./buildconf
    ./configure --prefix=/usr \
        --with-apr=/usr \
        --with-gdbm=/usr \
        --with-openssl=/usr \
        --without-pgsql \
        --build=x86_64-unknown-linux-gnu \
        --with-crypto
    make
    cd ../
    rm -rf apr
}

package() {
    make DESTDIR=${pkgdir} install
}
