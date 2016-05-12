#!/bin/sh

pkgname=file
pkgver=5.26
vcs=git
gittag=FILE${pkgver//\./_}
urls="ftp://ftp.astron.com/pub/file/file-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    git cherry-pick c4b6ea9b998882d08692599e28f4245714eaf8bb
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
