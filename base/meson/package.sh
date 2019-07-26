pkgname=meson
pkgver=0.51.0
vcs=git
gittag=${pkgver}
relmon_id=6472

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
