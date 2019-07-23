#!/bin/sh

pkgname=ocamlbuild
pkgver=0.14.0
vcs=git
gittag=${pkgver}
# wrong tags
#relmon_id=12387

kiin_make() {
    MAKEFLAGS=
    make configure PREFIX=/usr MANDIR=/usr/share/man
    make
}

kiin_install() {
    MAKEFLAGS=
    make DESTDIR=${pkgdir} install
}
