#!/bin/sh

pkgname=gnumeric
pkgver=1.12.33
vcs=git
git_repo=git://git.gnome.org/gnumeric
gittag=GNUMERIC_${pkgver//\./_}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    git cherry-pick 798755af32c42e395d167d9d49d14cbe449d2842
    git cherry-pick bf0abd9d3f8bf69f90eb155f0f1c93e0a2e9b2ba
    cp ../*.make .
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
