#!/bin/sh

pkgname=noscript
SKIP_ARCH_CHECK=1
pkgver=5.1.9
urls="https://secure.informaction.com/download/releases/noscript-${pkgver}.xpi"

kiin_make() {
    :
}

kiin_install() {
    _extension_id="{73a6fe31-595d-460b-a920-fcc0f8843232}"
    _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
    install -Dm644 ${SOURCES_HOME}/tarballs/noscript-${pkgver}.xpi "${_extension_dest}.xpi"
}