#!/bin/sh

#vcs=none
pkgname=unrar
pkgver=5.5.8
urls="http://www.rarlab.com/rar/unrarsrc-${pkgver}.tar.gz"
srctar=${pkgname}src-${pkgver}.tar.gz
srcdir=${location}/${pkgname}
relmon_id=13306

undead_make() {
    MAKEFLAGS=
    make -f makefile CXXFLAGS="-fPIC ${CXXFLAGS}" STRIP="true"
}

undead_install() {
    MAKEFLAGS=
    install -Dm755 unrar ${pkgdir}/usr/bin/unrar
}
