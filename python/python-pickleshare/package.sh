#!/bin/sh

pkgname=python-pickleshare
pkgver=0.7.5
vcs=git
vcs_pkgname=pickleshare
gittag=${pkgver}
relmon_id=12037

build() {
    :
}

package() {
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=0
}
