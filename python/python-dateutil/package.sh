#!/bin/sh

pkgname=python-dateutil
pkgver=2.8.0
vcs=git
vcs_pkgname=dateutil
gittag=${pkgver}
relmon_id=5621

build() {
    :
}

package() {
    python setup.py install --root=${pkgdir} --optimize=1
}
