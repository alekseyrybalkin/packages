#!/bin/sh

pkgname=python-prompt_toolkit
pkgver=2.0.9
vcs=git
vcs_pkgname=python-prompt-toolkit
gittag=${pkgver}
relmon_id=8742

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
