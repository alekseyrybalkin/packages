#!/bin/sh

pkgname=tar
pkgver=1.32
vcs=git
gittag=release_${pkgver//\./_}
urls="http://ftp.gnu.org/gnu/tar/tar-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
relmon_id=4939

kiin_make() {
    git clone -s `find_vcs_repo gnulib`
    git clone -s `find_vcs_repo paxutils`
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --enable-gcc-warnings=no \
        --build=x86_64-unknown-linux-gnu \
        --libexecdir=/usr/bin
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    make DESTDIR=${pkgdir} -C doc install-html docdir=/usr/share/doc/tar
}
