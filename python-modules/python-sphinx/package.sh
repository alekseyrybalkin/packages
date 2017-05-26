#!/bin/sh

pkgname=python-sphinx
pkgver=1.6.1
vcs=git
vcs_pkgname=sphinx
gittag=${pkgver}
# beta versions
#relmon_id=4031

kiin_make() {
    patch -p1 <../typing-module-py35+.patch
    make PYTHON=python3 build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
