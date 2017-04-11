#!/bin/sh

pkgname=libgsf
pkgver=1.14.41
ARCH_VERSION=1.14.41+3+gc7b4b53
vcs=git
git_repo=git://git.gnome.org/libgsf
gittag=LIBGSF_${pkgver//\./_}

kiin_make() {
    ./autogen.sh --prefix=/usr --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
