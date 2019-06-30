#!/bin/sh

pkgname=grep
pkgver=3.3
vcs=git
gittag=v${pkgver}
relmon_id=1251

kiin_make() {
    # build: avoid build failure with --enable-gcc-warnings
    git cherry-pick 6861bd8698b3177816fcc4d1a892df6e0701f1f6
    git clone -s `find_vcs_repo gnulib`
    ./bootstrap --skip-po
    ./configure --prefix=/usr \
        --build=x86_64-unknown-linux-gnu
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
}
