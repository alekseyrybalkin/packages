#!/bin/sh

pkgname=palemoon
pkgver=28.5.2
vcs=git
gittag=PM${pkgver}_Release

kiin_make() {
    cp ../mozconfig .
    sed -i 's#xlocale#locale#' intl/icu/source/i18n/digitlst.cpp
    patch -Np1 -i ../gcc9.patch

    echo "mk_add_options MOZ_MAKE_FLAGS='${MAKEFLAGS}'" >> mozconfig

    export MOZBUILD_STATE_PATH=${srcdir}/mozbuild
    export CPPFLAGS="${CPPFLAGS} -O2"
    python2 mach build
}

kiin_install() {
    cd pmbuild
    make package
    cd dist
    install -d ${pkgdir}/usr/{bin,lib}
    cp -r palemoon/ ${pkgdir}/usr/lib/${pkgname}
    ln -s ../lib/${pkgname}/palemoon ${pkgdir}/usr/bin/palemoon
}
