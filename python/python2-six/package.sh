pkgname=python2-six
ARCH_NAME=python-six
pkgver=1.12.0
vcs=git
vcs_pkgname=six
gittag=${pkgver}
relmon_id=4027

build() {
    python2 setup.py build
}

package() {
    python2 setup.py install --prefix=/usr --root="${pkgdir}"
}