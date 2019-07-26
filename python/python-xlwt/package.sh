pkgname=python-xlwt
pkgver=1.3.0
vcs=git
vcs_pkgname=xlwt
gittag=${pkgver}

build() {
    python setup.py build
}

package() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
}
