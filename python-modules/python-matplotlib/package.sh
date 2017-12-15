#!/bin/sh

pkgname=python-matplotlib
pkgver=2.1.1
vcs=git
vcs_pkgname=matplotlib
gittag=v${pkgver}
relmon_id=3919

kiin_make() {
    rm -rf .git
    sed -i '/Subprocess32/d' setup.py
    export XDG_RUNTIME_DIR=/tmp
    python setup.py build
}

kiin_install() {
    python setup.py install -O1 --skip-build --root ${pkgdir} --prefix=/usr
}
