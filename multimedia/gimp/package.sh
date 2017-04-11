#!/bin/sh

pkgname=gimp
pkgver=2.8.20
vcs=git
git_repo=git://git.gnome.org/gimp
gittag=GIMP_${pkgver//\./_}

kiin_make() {
    sed -i '/gegl/s/2/3/' configure.ac
    sed -i '70,75 d' app/core/gimpparamspecs-duplicate.c
    ./autogen.sh --prefix=/usr \
        --sysconfdir=/etc \
        --without-gvfs \
        --without-dbus \
        --disable-python \
        --with-gimpdir=.config/gimp
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
