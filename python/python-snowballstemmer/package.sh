#!/bin/sh

pkgname=python-snowballstemmer
pkgver=1.2.1
vcs=git
vcs_pkgname=snowball_py
#FIXME no tag
gittag=04f57de7f961bbec80efde2fe933fedf5e56ea71
relmon_id=7853

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir} --optimize=1
}
