pkgname=python-zipp
pkgver=0.5.2
vcs=git
vcs_pkgname=zipp
gittag=v${pkgver}

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir} --optimize=1
}
