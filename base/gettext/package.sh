#!/bin/sh

#vcs=git
#git_repo=git://git.savannah.gnu.org/gettext.git
#git_problem="requires to download archive.dir.tar.xz from internets"
pkgname=gettext
pkgver=0.20.1
urls="http://ftp.gnu.org/gnu/gettext/gettext-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
relmon_id=898

kiin_make() {
    ./configure --prefix=/usr \
        --docdir=/usr/share/doc/gettext \
        --with-included-libxml \
        --with-included-glib \
        --with-included-libcroco \
        --disable-static \
        --build=x86_64-unknown-linux-gnu \
        --without-git
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
