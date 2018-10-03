#!/bin/sh

pkgname=python-prompt_toolkit
pkgver=1.0.15
vcs=git
vcs_pkgname=python-prompt-toolkit
# FIXME
gittag=4476b3c28add85c5a8169fbb81ded8c3b845e588
#gittag=${pkgver}
relmon_id=8742

kiin_make() {
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
