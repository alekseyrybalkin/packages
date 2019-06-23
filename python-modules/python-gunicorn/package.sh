#!/bin/sh

pkgname=python-gunicorn
ARCH_NAME=gunicorn
pkgver=19.9.0
vcs=git
vcs_pkgname=gunicorn
gittag=${pkgver}
relmon_id=3882

kiin_make() {
    python setup.py build
    #cd docs
    #make html
}

kiin_install() {
    python setup.py install --prefix=/usr --root=${pkgdir}
    #mkdir -pv ${pkgdir}/usr/share/doc
    #cp -r docs/build/html ${pkgdir}/usr/share/doc/python-gunicorn
}
