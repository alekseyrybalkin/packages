#!/bin/sh

pkgname=lame
pkgver=3.100
vcs=git-svn
vcs_clone='git svn clone -Ttrunk -ttags https://svn.code.sf.net/p/lame/svn/ lame-git-svn'
gittag=origin/tags/${pkgver}
urls="http://downloads.sourceforge.net/lame/lame-${pkgver}.tar.gz"
srctar=${pkgname}-${pkgver}.tar.gz

kiin_make() {
    ./configure --prefix=/usr \
        --enable-mp3rtp \
        --disable-static
    make
}

kiin_install() {
    make DESTDIR=${pkgdir} pkghtmldir=/usr/share/doc/lame-${pkgver} install
}
