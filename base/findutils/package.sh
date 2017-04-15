#!/bin/sh

pkgname=findutils
pkgver=4.6.0
vcs=git
gittag=v${pkgver}
relmon_id=812

kiin_make() {
    export DO_NOT_WANT_CHANGELOG_DRIVER=1
    git clone -s ${KIIN_HOME}/sources/gnulib
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --libexecdir=/usr/lib/findutils \
        --localstatedir=/var/lib/locate
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    # remove /var, filesystem package creates everything in there
    rm -rvf ${pkgdir}/var
}
