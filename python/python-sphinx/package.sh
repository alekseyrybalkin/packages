#!/bin/sh

pkgname=python-sphinx
pkgver=2.1.2
vcs=git
vcs_pkgname=sphinx
gittag=v${pkgver}
relmon_id=4031
contrib="qthelp serializinghtml websupport htmlhelp jsmath devhelp applehelp log-cabinet"

build() {
    make build

    for c in ${contrib}; do
        git clone `find_vcs_repo sphinxcontrib-${c}`
        cd sphinxcontrib-${c}
        python setup.py build
    done
}

package() {
    python setup.py install --root=${pkgdir} --optimize=1

    for c in ${contrib}; do
        cd sphinxcontrib-${c}
        python setup.py install --root=${pkgdir}
    done
}
