#!/bin/sh

pkgname=ccache
pkgver=3.4.2
vcs=git
gittag=v${pkgver}
relmon_id=257

kiin_make() {
    export CFLAGS="${CFALGS} -Wimplicit-fallthrough=0"
    ./autogen.sh
    ./configure --prefix=/usr \
        --sysconfdir=/etc
    make
}

kiin_install() {
    CHOST=x86_64-unknown-linux-gnu
    install -Dm 755 ccache ${pkgdir}/usr/bin/ccache

    install -d ${pkgdir}/usr/lib/ccache/bin
    ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/cc
    ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/gcc
    ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/g++
    ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/cpp
    ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/c++
    ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/${CHOST}-cc
    ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/${CHOST}-gcc
    ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/${CHOST}-g++
    ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/${CHOST}-cpp
    ln -sf /usr/bin/ccache ${pkgdir}/usr/lib/ccache/bin/${CHOST}-c++
}
