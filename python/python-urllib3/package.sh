pkgname=python-urllib3
pkgver=1.25.3
vcs=git
vcs_pkgname=urllib3
gittag=${pkgver}
relmon_id=4078

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}