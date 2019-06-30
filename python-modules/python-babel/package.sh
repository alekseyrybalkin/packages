#!/bin/sh

pkgname=python-babel
pkgver=2.7.0
_cldr_core_ver=35.1
vcs=git
vcs_pkgname=babel
gittag=v${pkgver}
extra_urls="https://unicode.org/Public/cldr/${_cldr_core_ver}/core.zip"
wget_set_filename=cldr-core-${_cldr_core_ver}.zip
relmon_id=11984

kiin_make() {
    cp ${SOURCES_HOME}/tarballs/cldr-core-${_cldr_core_ver}.zip ./cldr/
    python setup.py import_cldr
    python setup.py build
}

kiin_install() {
    python setup.py install --root=${pkgdir} --optimize=1
}
