pkgname=python-kiwisolver
pkgver=1.1.0
vcs=git
vcs_pkgname=kiwi
gittag=${pkgver}
relmon_id=16910

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir} --optimize=1
}