pkgname=python-click
pkgver=7.0
vcs=git
vcs_pkgname=click
gittag=${pkgver}
relmon_id=3802

build() {
    python setup.py build
}

package() {
    python setup.py install --prefix=/usr --root=${pkgdir}
}
