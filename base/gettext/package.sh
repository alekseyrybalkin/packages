#!/bin/sh

#vcs=git
#git_repo=git://git.savannah.gnu.org/gettext.git
#git_problem="requires to download archive.dir.tar.xz from internets"
pkgname=gettext
pkgver=0.19.8
urls="http://ftp.gnu.org/gnu/gettext/gettext-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./configure --prefix=/usr \
        --docdir=/usr/share/doc/gettext \
        --with-included-libxml \
        --with-included-glib \
        --with-included-libcroco \
        --disable-static \
        --without-git
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
