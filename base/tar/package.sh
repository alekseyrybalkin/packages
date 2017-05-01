#!/bin/sh

pkgname=tar
pkgver=1.29
vcs=git
gittag=release_${pkgver//\./_}
urls="http://ftp.gnu.org/gnu/tar/tar-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
relmon_id=4939

kiin_make() {
    git clone -s ${KIIN_HOME}/sources/gnulib
    git clone -s ${KIIN_HOME}/sources/paxutils
    # Report positional options that were used but had no effect during archive creation
    git cherry-pick 9a33077a7b7ad7d32815a21dee54eba63b38a81c
    git cherry-pick ac065c57fdc1788a2769fb119ed0c8146e1b9dd6
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
