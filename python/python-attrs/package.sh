pkgname=python-attrs
pkgver=19.1.0
vcs=git
vcs_pkgname=attrs
gittag=${pkgver}
relmon_id=15099

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
