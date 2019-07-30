pkgname=python-packaging
pkgver=19.1
vcs=git
vcs_pkgname=packaging
gittag=${pkgver}
relmon_id=11718

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
