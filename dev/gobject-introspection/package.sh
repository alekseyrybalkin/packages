#!/bin/sh

pkgname=gobject-introspection
pkgver=1.50.0
ARCH_VERSION=1.50.0+1+gb8d92b0
vcs=git
git_repo=git://git.gnome.org/gobject-introspection
gittag=${pkgver}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    sed -i '1s|#!/usr/bin/env python$|&2|' giscanner/*.py
    PYTHON=/usr/bin/python2 ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
