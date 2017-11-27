#!/bin/sh

pkgname=python-decorator
pkgver=4.1.2
vcs=git
vcs_pkgname=decorator
# FIXME
gittag=00584a5550de21c1af952c141a6bc272d6020035

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
