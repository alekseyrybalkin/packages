pkgname=python-mwparserfromhell
SKIP_ARCH_CHECK=1
pkgver=0.5.4
vcs=git
vcs_pkgname=mwparserfromhell
gittag=v${pkgver}

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
