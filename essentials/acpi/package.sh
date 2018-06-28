#!/bin/sh

pkgname=acpi
pkgver=1.7
vcs=git
git_repo=git://git.code.sf.net/p/acpiclient/code
gittag=${pkgver}
relmon_id=17

undead_make() {
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
