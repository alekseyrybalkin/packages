pkgname=python-statsmodels
pkgver=0.10.0
vcs=git
vcs_pkgname=statsmodels
gittag=v${pkgver}
relmon_id=4039

build() {
    python setup.py build
}

package() {
    python setup.py install --skip-build --root=${pkgdir} --optimize=1
    rm ${pkgdir}/usr/{LICENSE.txt,setup.cfg}
}
