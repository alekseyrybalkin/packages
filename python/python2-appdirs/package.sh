pkgname=python2-appdirs
ARCH_NAME=python-appdirs
pkgver=1.4.3
vcs=git
vcs_pkgname=appdirs
gittag=${pkgver}
relmon_id=6278

build() {
    python2 setup.py build
}

package() {
    python2 setup.py install --root=${pkgdir}
}