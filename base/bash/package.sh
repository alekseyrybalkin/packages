#!/bin/sh

pkgname=bash
_major=5.0
_minor=007
pkgver=${_major}.${_minor}
ARCH_VERSION=${_major}.${_minor}
vcs=git
# FIXME
gittag=3ba697465bc74fab513a26dea700cc82e9f4724e
relmon_id=166

kiin_make() {
    ./configure --prefix=/usr \
        --htmldir=/usr/share/doc/bash \
        --without-bash-malloc \
        --with-installed-readline
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    ln -sv bash ${pkgdir}/usr/bin/sh
}
