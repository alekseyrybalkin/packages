#!/bin/sh

_pkgname=xinit
pkgname=xorg-${_pkgname}
pkgver=1.4.1
vcs=git
gittag=${_pkgname}-${pkgver}

build() {
    ./autogen.sh $XORG_CONFIG \
        --with-xinitdir=/etc/X11/app-defaults
    make
    sed -i -e "s/xserverauthfile=\$HOME\/\.serverauth\.\$\$$/xserverauthfile=\$XAUTHORITY; touch \$XAUTHORITY/g" startx
}

package() {
    make DESTDIR=${pkgdir} install
    mv ${pkgdir}/etc/X11/app-defaults/xinitrc{,.packaged}
}
