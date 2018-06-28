#!/bin/sh

pkgname=apr-util
pkgver=1.6.1
vcs=git
gittag=${pkgver}
extension=bz2
folder="http://archive.apache.org/dist/apr/"
check_server=1
relmon_id=96

. ${UNDEAD_REPO}/defaults.sh

undead_make() {
    cd ../
    git clone -s ${SOURCES_HOME}/apr apr
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

undead_install() {
    make DESTDIR=${pkgdir} install
}
