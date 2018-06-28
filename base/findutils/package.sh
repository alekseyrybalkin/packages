#!/bin/sh

pkgname=findutils
pkgver=4.6.0
vcs=git
gittag=v${pkgver}
relmon_id=812

undead_make() {
    export DO_NOT_WANT_CHANGELOG_DRIVER=1
    git clone -s ${UNDEAD_HOME}/sources/gnulib
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --libexecdir=/usr/lib/findutils \
        --build=x86_64-unknown-linux-gnu \
        --localstatedir=/var/lib/locate
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
    # remove /var, filesystem package creates everything in there
    rm -rvf ${pkgdir}/var
}
