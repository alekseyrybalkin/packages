pkgname=python-wheel
pkgver=0.33.4
vcs=git
vcs_pkgname=wheel
hgtag=${pkgver}
# alpha versions
#relmon_id=11428

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
