pkgname=python-numpy
pkgver=1.16.4
vcs=git
vcs_pkgname=numpy
gittag=v${pkgver}
relmon_id=2509

build() {
    python setup.py build
}

package() {
    python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1
}
