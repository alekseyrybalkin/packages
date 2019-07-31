pkgname=python-gevent
pkgver=1.4.0
vcs=git
vcs_pkgname=gevent
gittag=${pkgver}
relmon_id=6835
relmon_rules="skip_a"

build() {
    # apparently, gevent cannot autodetect PATH_SEPARATOR when there is only one
    # item in $PATH (see zz40-xc-ovr.m4)
    PATH=${PATH}:/bin
    sed -i 's/C.UTF-8/en_US.UTF-8/' Makefile
    EMBED=1 \
    CYTHON=cython \
    PYTHON=python \
    python setup.py build
}

package() {
    python setup.py install --root=${pkgdir}
}
