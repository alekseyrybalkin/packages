pkgname=python-opengl
ARCH_NAME=pyopengl
pkgver=3.1.0
vcs=bzr
vcs_pkgname=pyopengl
bzrtag=release-${pkgver}
relmon_id=3754
relmon_rules="skip_a,skip_b"

build() {
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
