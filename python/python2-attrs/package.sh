pkgname=python2-attrs
ARCH_NAME=python-attrs
pkgver=19.1.0
vcs=git
vcs_pkgname=attrs
gittag=${pkgver}
relmon_id=15099

build() {
    python2 setup.py build
}

package() {
    python2 setup.py install --root=${pkgdir}
}
