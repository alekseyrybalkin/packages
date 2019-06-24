#!/bin/sh

pkgname=noscript
#FIXME update to 5.1.9 when site is available
pkgver=5.1.8.3
urls="https://secure.informaction.com/download/releases/noscript-${pkgver}.xpi"

kiin_make() {
    :
}

kiin_install() {
    _extension_id="{73a6fe31-595d-460b-a920-fcc0f8843232}"
    _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
    install -Dm644 ${SOURCES_HOME}/tarballs/noscript-${pkgver}.xpi "${_extension_dest}.xpi"
}
