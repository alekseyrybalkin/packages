pkgname=python-youtube-dl
ARCH_NAME=youtube-dl
pkgver=2019.07.27
vcs=git
vcs_pkgname=youtube-dl
gittag=${pkgver}
relmon_id=5292

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir} --optimize=1
    rm -rf ${pkgdir}/usr/etc
}