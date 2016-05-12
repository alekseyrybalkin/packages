#!/bin/sh

pkgname=libgsf
pkgver=1.14.36
vcs=git
git_repo=git://git.gnome.org/libgsf
gittag=LIBGSF_${pkgver//\./_}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    ./autogen.sh --prefix=/usr --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
