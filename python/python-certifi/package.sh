pkgname=python-certifi
_pkgver=2019.06.16
pkgver=${_pkgver//\.0/\.}
vcs=git
gittag=${_pkgver}
relmon_id=7995

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
