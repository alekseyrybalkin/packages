#!/bin/sh

pkgname=gdbm
pkgver=1.13
vcs=git
# FIXME
gittag=2343e816784c79d68bcd328bf84c23c46428a6ae
relmon_id=882

undead_make() {
    MAKEFLAGS=
    autoreconf -fi
    ./configure --prefix=/usr --disable-static --enable-libgdbm-compat
    make
}

undead_install() {
    MAKEFLAGS=
    make prefix=${pkgdir}/usr install
}
