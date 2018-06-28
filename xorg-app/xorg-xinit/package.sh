#!/bin/sh

_pkgname=xinit
pkgname=xorg-${_pkgname}
pkgver=1.4.0
vcs=git
gittag=${_pkgname}-${pkgver}

undead_make() {
    ./autogen.sh $XORG_CONFIG \
        --with-xinitdir=/etc/X11/app-defaults
    make
    sed -i -e "s/xserverauthfile=\$HOME\/\.serverauth\.\$\$$/xserverauthfile=\$XAUTHORITY; touch \$XAUTHORITY/g" startx
}

undead_install() {
    make DESTDIR=${pkgdir} install
    # use xinitrc from undead-configs
    mv ${pkgdir}/etc/X11/app-defaults/xinitrc{,.packaged}
}
