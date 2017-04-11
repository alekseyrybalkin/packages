#!/bin/sh

pkgname=autoconf2.13
pkgver=2.13
vcs=git
vcs_pkgname=autoconf
gittag=df646e7699865557f342782df1134d9e75eb4628
urls="http://ftpmirror.gnu.org/autoconf/autoconf-${pkgver}.tar.gz"
srctar=autoconf-${pkgver}.tar.gz

kiin_make() {
    cp ../autoupdate.sh .
    ./configure --prefix=/usr \
        --infodir=/usr/share/info \
        --program-suffix=-2.13
    make
}

kiin_install() {
    make prefix="${pkgdir}/usr" \
        infodir="${pkgdir}/usr/share/info" install
    mv "${pkgdir}"/usr/share/info/autoconf{,-2.13}.info
    mv "${pkgdir}"/usr/share/info/standards{,-2.13}.info
}
