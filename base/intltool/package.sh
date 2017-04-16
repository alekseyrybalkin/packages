#!/bin/sh

pkgname=intltool
pkgver=0.51.0
vcs=bzr
bzrtag=release-${pkgver//\./_}
urls="http://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz
relmon_id=1385

kiin_make() {
    ./autogen.sh --prefix=/usr
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} install
    install -v -m644 -D doc/I18N-HOWTO \
        ${pkgdir}/usr/share/doc/${pkgname}/I18N-HOWTO
}
