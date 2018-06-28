#!/bin/sh

pkgname=gobject-introspection
pkgver=1.56.0
vcs=git
git_repo=git://git.gnome.org/gobject-introspection
gittag=${pkgver}
# development versions
#relmon_id=1223

undead_make() {
    sed -i '1s|#!/usr/bin/env python$|&2|' giscanner/*.py
    PYTHON=/usr/bin/python2 ./autogen.sh --prefix=/usr
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
