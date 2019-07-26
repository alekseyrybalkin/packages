pkgname=python-mss
SKIP_ARCH_CHECK=1
pkgver=4.0.3
vcs=git
gittag=v${pkgver}

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
