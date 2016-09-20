#!/bin/sh

#vcs=none
pkgname=ladspa
pkgver=1.13
urls="https://github.com/OpenMandrivaAssociation/ladspa/raw/master/${pkgname}_sdk_${pkgver}.tgz"
srctar=${pkgname}_sdk_${pkgver}.tgz
srcdir=${location}/${pkgname}_sdk

kiin_make() {
    cd src
    sed \
        -e 's/mkdirhier/mkdir -p/' \
        -e "s#-O3#${CFLAGS} ${LDFLAGS/,--as-needed/}#" \
        -i makefile
    make targets
}

kiin_install() {
    cd src
    make INSTALL_PLUGINS_DIR=${pkgdir}/usr/lib/ladspa/ \
        INSTALL_INCLUDE_DIR=${pkgdir}/usr/include/ \
        INSTALL_BINARY_DIR=${pkgdir}/usr/bin/ install
}
