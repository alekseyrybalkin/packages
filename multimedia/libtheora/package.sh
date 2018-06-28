#!/bin/sh

pkgname=libtheora
pkgver=1.1.1+
vcs=git
# FIXME
gittag=fbb275803696085225c310773474ef4dcf8a4528
urls="http://downloads.xiph.org/releases/theora/libtheora-${pkgver}.tar.xz"
srctar=${pkgname}-${pkgver}.tar.xz
relmon_id=11793

undead_make() {
    # http://forums.gentoo.org/viewtopic-t-984400.html?sid=d3c947c3a5ee63de38511920a756f2ef
    export LDFLAGS="$LDFLAGS -lm"
    sed -i 's/png_\(sizeof\)/\1/g' examples/png2theora.c
    ./autogen.sh --prefix=/usr --disable-static
    make
}

undead_install() {
    make DESTDIR=${pkgdir} install
}
