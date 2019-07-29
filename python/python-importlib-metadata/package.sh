pkgname=python-importlib-metadata
pkgver=0.19
vcs=git
vcs_pkgname=importlib_metadata
gittag=${pkgver}

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir} --optimize=1
}