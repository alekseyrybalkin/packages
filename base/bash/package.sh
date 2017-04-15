#!/bin/sh

pkgname=bash
pkgver=4.4.012
vcs=git
gittag=bc007799f0e1362100375bb95d952d28de4c62fb
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
