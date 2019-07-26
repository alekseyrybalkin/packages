pkgname=python-parso
pkgver=0.5.0
vcs=git
vcs_pkgname=parso
gittag=v${pkgver}

build() {
    :
}

package() {
    python setup.py install --root=${pkgdir} --optimize=1
}
