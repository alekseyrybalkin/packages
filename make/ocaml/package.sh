#!/bin/sh

pkgname=ocaml
pkgver=4.08.0
vcs=git
gittag=${pkgver}
relmon_id=2518

kiin_make() {
    ./configure --prefix /usr \
        --mandir /usr/share/man
    make --debug=v world.opt
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
