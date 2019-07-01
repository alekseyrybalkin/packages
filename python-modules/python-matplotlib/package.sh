#!/bin/sh

pkgname=python-matplotlib
pkgver=3.1.1
_jquery_ui_version=1.12.1
vcs=git
vcs_pkgname=matplotlib
gittag=v${pkgver}
extra_urls="https://jqueryui.com/resources/download/jquery-ui-${_jquery_ui_version}.zip"
relmon_id=3919

kiin_make() {
    unzip ${TARBALLS_HOME}/jquery-ui-${_jquery_ui_version}.zip
    python setup.py build
}

kiin_install() {
    mkdir -p ${pkgdir}/usr/lib/python3.7/site-packages/matplotlib/backends/web_backend/
    cp -r jquery-ui-${_jquery_ui_version} ${pkgdir}/usr/lib/python3.7/site-packages/matplotlib/backends/web_backend/
    python setup.py install --root ${pkgdir} --prefix=/usr --optimize=1 --skip-build
}
