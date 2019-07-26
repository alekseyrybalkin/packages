#!/bin/sh

pkgname=python-matplotlib
pkgver=3.1.1
vcs=git
vcs_pkgname=matplotlib
gittag=v${pkgver}
relmon_id=3919

build() {
    # disable installation of jquery-ui
    sed -i -e 's/not os.path.exists/os.path.exists/g' setup.py
    python setup.py build
}

package() {
    python setup.py install --root ${pkgdir} --prefix=/usr --optimize=1 --skip-build
}
