#!/bin/sh

pkgname=tcl
pkgver=8.6.5
vcs=fossil
fossiltag=core-${pkgver//\./-}
srcdir=${location}/${pkgname}-${pkgver}

kiin_make() {
    cd unix
    ./configure --prefix=/usr \
        --mandir=/usr/share/man \
        --enable-threads \
        --enable-64bit
    make
}

kiin_install() {
    cd unix
    make INSTALL_ROOT=${pkgdir} install install-private-headers
    ln -sf tclsh${pkgver%.*} ${pkgdir}/usr/bin/tclsh
    ln -sf libtcl${pkgver%.*}.so ${pkgdir}/usr/lib/libtcl.so

    #tdbcver=tdbc1.0.4
    #tdbcver=`ls -d ${pkgdir}/usr/lib/tdbc1* | sed "s/${pkgdir}\/usr\/lib\///g"`
    #itclver=itcl4.0.4
    #itclver=`ls -d ${pkgdir}/usr/lib/itcl4* | sed "s/${pkgdir}\/usr\/lib\///g"`

    # remove buildroot traces
    sed -e "s#${srcdir}/unix#/usr/lib#g" \
        -e "s#${srcdir}#/usr/include#g" \
        -i "${pkgdir}/usr/lib/tclConfig.sh"

    #sed -e "s#${srcdir}/tcl${pkgver}/unix/pkgs/${tdbcver}#/usr/lib/${tdbcver}#" \
    #    -e "s#${srcdir}/tcl${pkgver}/pkgs/${tdbcver}/generic#/usr/include#" \
    #    -e "s#${srcdir}/tcl${pkgver}/pkgs/${tdbcver}/library#/usr/lib/tcl${pkgver%.*}#" \
    #    -e "s#${srcdir}/tcl${pkgver}/pkgs/${tdbcver}#/usr/include#" \
    #    -i "${pkgdir}/usr/lib/${tdbcver}/tdbcConfig.sh"

    #sed -e "s#${srcdir}/tcl${pkgver}/unix/pkgs/${itclver}#/usr/lib/${itclver}#" \
    #    -e "s#${srcdir}/tcl${pkgver}/pkgs/${itclver}/generic#/usr/include#" \
    #    -e "s#${srcdir}/tcl${pkgver}/pkgs/${itclver}#/usr/include#" \
    #    -i "${pkgdir}/usr/lib/${itclver}/itclConfig.sh"
}
