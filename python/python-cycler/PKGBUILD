pkgname=python-cycler
pkgver=0.10.0
vcs=git
vcs_pkgname=cycler
gittag=v${pkgver}
relmon_id=11552

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir} --optimize=1
}
