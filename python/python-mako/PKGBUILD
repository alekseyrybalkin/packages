pkgname=python-mako
pkgver=1.0.14
vcs=git
vcs_pkgname=mako
gittag=rel_${pkgver//\./_}
relmon_id=3915

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
