pkgname=python-sphinx-pallets-themes
SKIP_ARCH_CHECK=1
pkgver=1.2.1
vcs=git
vcs_pkgname=pallets-sphinx-themes
gittag=${pkgver}

build() {
    python setup.py build
}

package() {
    python setup.py install --prefix=/usr --root=${pkgdir}
}
