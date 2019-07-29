pkgname=python-ipython
ARCH_NAME=ipython
pkgver=7.7.0
vcs=git
vcs_pkgname=ipython
gittag=${pkgver}
relmon_id=1399

build() {
    sed -i 's|backports.shutil_get_terminal_size|shutil|' IPython/utils/terminal.py
}

package() {
    python setup.py install --prefix=/usr --root=${pkgdir} --optimize=0
}