#!/bin/sh

pkgname=gimp
pkgver=2.8.16
vcs=git
git_repo=git://git.gnome.org/gimp
gittag=GIMP_${pkgver//\./_}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
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
