pkgname=python-wheel
pkgver=0.33.4
vcs=git
vcs_pkgname=wheel
hgtag=${pkgver}
relmon_id=11428
relmon_rules="skip_a"

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
