pkgname=python2-cython
ARCH_NAME=cython
pkgver=0.29.13
vcs=git
vcs_pkgname=cython
gittag=${pkgver}
relmon_id=12679

build() {
    python2 setup.py build
}

package() {
    python2 setup.py install --root=${pkgdir}
    mv ${pkgdir}/usr/bin/cygdb ${pkgdir}/usr/bin/cygdb2
    mv ${pkgdir}/usr/bin/cython ${pkgdir}/usr/bin/cython2
    mv ${pkgdir}/usr/bin/cythonize ${pkgdir}/usr/bin/cythonize2
}
