#!/bin/sh

pkgname=apr-util
pkgver=1.6.0
vcs=git
gittag=${pkgver}
extension=bz2
folder="http://archive.apache.org/dist/apr/"
check_server=1
relmon_id=96

. ${KIIN_REPO}/defaults.sh

kiin_make() {
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
        --with-crypto
    make
    cd ../
    rm -rf apr
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
