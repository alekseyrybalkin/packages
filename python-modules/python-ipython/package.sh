#!/bin/sh

pkgname=python-ipython
pkgver=6.2.1
vcs=git
vcs_pkgname=ipython
gittag=${pkgver}
relmon_id=1399

kiin_make() {
    sed -i 's|backports.shutil_get_terminal_size|shutil|' IPython/utils/terminal.py
}

kiin_install() {
    python setup.py install --prefix=/usr --root=${pkgdir} --optimize=0
}
