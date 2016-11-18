#!/bin/sh

pkgname=python-cairo
pkgver=1.10.0
vcs=git
vcs_pkgname=pycairo
gittag=a2d54c73e2d50159fef593d112e1c1dccb8b4222
srcdir=${location}/pycairo-${pkgver}

kiin_make() {
    sed -e "s/ctx.\(tool_options\|check_tool\)(/ctx.load(/" -i wscript
    sed -i -e 's/compiler_cc/compiler_c/g' wscript
    cp -r ${SOURCES_HOME}/waf/{waf-light,waflib} ./
    mv waf-light waf
    python ./waf --version
    ./waf configure --prefix=/usr
    ./waf build
}

kiin_install() {
    ./waf install --destdir=${pkgdir}
    mv ${pkgdir}/usr/lib{64,}
}
