#!/bin/sh

pkgname=bash
_major=4.4
_minor=12
pkgver=${_major}.${_minor}
ARCH_VERSION=${_major}.0${_minor}
vcs=git
# FIXME
gittag=bc007799f0e1362100375bb95d952d28de4c62fb
relmon_id=166

undead_make() {
    patch -Np1 -i ../always.source.bashrc.diff
    ./configure --prefix=/usr \
        --htmldir=/usr/share/doc/bash \
        --without-bash-malloc \
        --with-installed-readline
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
    ln -sv bash ${pkgdir}/usr/bin/sh
}
