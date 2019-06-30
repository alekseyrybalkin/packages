#!/bin/sh

pkgname=sed
pkgver=4.7
vcs=git
gittag=v${pkgver}
urls="http://ftp.gnu.org/gnu/sed/sed-${pkgver}.tar.bz2"
srctar=${pkgname}-${pkgver}.tar.bz2
relmon_id=4789

kiin_make() {
    git clone -s `find_vcs_repo gnulib`
    sed -i -e '/\/missing/d' bootstrap
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
