#!/bin/sh

pkgname=psmisc
pkgver=22.21
vcs=git
gittag=v${pkgver}
urls="http://prdownloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
relmon_id=3721

kiin_make() {
    # Typo in fuser makes -M on all the time
    git cherry-pick 3638cc55b4d08851faba46635d737b24d016665b
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
