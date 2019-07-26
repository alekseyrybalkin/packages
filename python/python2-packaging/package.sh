pkgname=python2-packaging
ARCH_NAME=python-packaging
pkgver=19.0
vcs=git
vcs_pkgname=packaging
gittag=${pkgver}
relmon_id=11718

build() {
    python2 setup.py build
}

package() {
    python2 setup.py install --root=${pkgdir}
}
